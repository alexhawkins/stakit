// Javascript to enable link to tab
var hash = document.location.hash;
var prefix = "tab_";

if (hash) {
    hash = hash.replace(prefix,'');
    var hashPieces = hash.split('?');
    activeTab = $('.nav-tabs a[href=' + hashPieces[0] + ']');
    activeTab && activeTab.tab('show');
} 

// Change hash for page-reload
$('.nav-tabs a').on('shown.bs.tab', function (e) {
    window.location.hash = e.target.hash.replace("#", "#" + prefix);
});