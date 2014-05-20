class Users::SessionsController < Devise::SessionsController
  def create
    super do |resource|
      if current_user.sign_in_count <= 1 && current_user.confirmed_at?
       
        @brain_stack = Stack.create(user_id: current_user.id, name: 'Sample Brain Stack')
        @fitness_stack = Stack.create(user_id: current_user.id, name: 'Sample Fitness Stack')
        @starter_stack = Stack.create(user_id: current_user.id, name: 'My Starter Stack')
        @starter_stack_id = @starter_stack.id
        #create a new Supplement array with the first 8 supplements we have, then iterate
        Supplement.take(8).each do |supplement|
            #Create and new Stack Supplement association for each supplement in this beginner stack
            StackSupplement.create(stack_id: @starter_stack_id, supplement_id: supplement.id)
          end
        @stack_supplement = StackSupplement.first
        #create a beginner brain stack for the user
        StackSupplement.create(stack_id: @brain_stack.id, supplement_id: 2)
        #create a beginner fitness stack for the user
        StackSupplement.create(stack_id: @fitness_stack.id, supplement_id: 3)
        #stack_stack_supplements_path(@stack, @stack_supplement)
      else
        
        @stack = current_user.stacks.where(user_id: current_user.id).find(:first, :order => 'created_at DESC')
        #stack_stack_supplements_path(@stack)
       end
    end
  end
end