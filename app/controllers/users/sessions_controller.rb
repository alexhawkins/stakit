class Users::SessionsController < Devise::SessionsController
  def create
    super do |resource|
      if current_user.sign_in_count <= 1 && current_user.confirmed_at?
        @alex_hawkins = User.find(2)
        Relationship.create(follower_id: current_user.id, followed_id: @alex_hawkins.id)
        Relationship.create(follower_id: @alex_hawkins.id, followed_id: current_user.id)
        @brain_stack = Stack.create(user_id: current_user.id, name: 'Sample Brain Stack')
        @fitness_stack = Stack.create(user_id: current_user.id, name: 'Sample Fitness Stack')
        @starter_stack = Stack.create(user_id: current_user.id, name: 'My Starter Stack', default: true)
        @starter_stack_id = @starter_stack.id
        #create a new Supplement array with the first 8 supplements we have, then iterate
        Supplement.take(8).each do |supplement|
            #Create and new Stack Supplement association for each supplement in this beginner stack
            StackSupplement.create(stack_id: @starter_stack_id, supplement_id: supplement.id, frequency_id: 1, dose: supplement.default_dose)
          end
        #create a beginner brain stack for the user
        StackSupplement.create(stack_id: @brain_stack.id, supplement_id: 2, frequency_id: 1, dose: "500 mg")
        #create a beginner fitness stack for the user
        StackSupplement.create(stack_id: @fitness_stack.id, supplement_id: 3, frequency_id: 1, dose: "500 mg")
        #stack_stack_supplements_path(@stack, @stack_supplement)
        redirect_to stack_stack_supplements_path(@starter_stack) and return
      else
        @stack = current_user.stacks.where(default: true).first
        redirect_to stack_stack_supplements_path(@stack) and return
       end
    end
  end
end