$.fn.extend({
	enter: function() {//plugins creation
		return this.each(function() {
			var this_class = $(this).attr("class");
			if(this_class!='no'){
				if($(this).find("img")[0]){
					var pth = $(this).find("img")[0];
					 //alert($(this).children().attr("href"));
					$(this).focus(function(){
							$(pth).attr("src",pth.src.replace(/_off/g, '_on'));// mouse over Image
					})
					.mouseover(function(){
						$(pth).attr("src",pth.src.replace(/_off/g, '_on'));// mouse over Image
					})
					.mouseout(function(){
						$(pth).attr("src",pth.src.replace(/_on/g, '_off'));// mouse out image
					})
					.blur(function(){
						$(pth).attr("src",pth.src.replace(/_on/g, '_off'));// mouse out image
					});
				}
			}
		});
	}
});