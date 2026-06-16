// JavaScript Document
$(document).ready(function(){
						   
//---------------------Script Accordion

    jQuery().ready(function () {
        // simple accordion
        jQuery('#list1a').accordion();
        jQuery('#list1b').accordion({
            autoheight: false
        });

        // second simple accordion with special markup
        jQuery('#navigation').accordion({
            active: false,
            header: '.head',
            navigation: true,
            event: 'mouseover',
            fillSpace: true,
            animated: 'easeslide'
        });

        // highly customized accordion
        jQuery('#list2').accordion({
            event: 'mouseover',
            active: '.selected',
            selectedClass: 'active',
            animated: "bounceslide",
            header: "dt"
        }).bind("change.ui-accordion", function (event, ui) {
            jQuery('<div>' + ui.oldHeader.text() + ' hidden, ' + ui.newHeader.text() + ' shown</div>').appendTo('#log');
        });

        // first simple accordion with special markup
        jQuery('#list3').accordion({
            header: 'div.title',
            active: false,
            alwaysOpen: false,
            animated: false,
            autoheight: false
        });

        var wizard = $("#wizard").accordion({
            header: '.title',
            event: false
        });

        var wizardButtons = $([]);
        $("div.title", wizard).each(function (index) {
            wizardButtons = wizardButtons.add($(this)
			.next()
			.children(":button")
			.filter(".next, .previous")
			.click(function () {
			    wizard.accordion("activate", index + ($(this).is(".next") ? 1 : -1))
			}));
        });

        // bind to change event of select to control first and seconds accordion
        // similar to tab's plugin triggerTab(), without an extra method
        var accordions = jQuery('#list1a, #list1b, #list2, #list3, #navigation, #wizard');

        jQuery('#switch select').change(function () {
            accordions.accordion("activate", this.selectedIndex - 1);
        });
        jQuery('#close').click(function () {
            accordions.accordion("activate", -1);
        });
        jQuery('#switch2').change(function () {
            accordions.accordion("activate", this.value);
        });
        jQuery('#enable').click(function () {
            accordions.accordion("enable");
        });
        jQuery('#disable').click(function () {
            accordions.accordion("disable");
        });
        jQuery('#remove').click(function () {
            accordions.accordion("destroy");
            wizardButtons.unbind("click");
        });
    });


//---------------------Fim Script Accordion

	$(".fade").hover(function(){
        $(this).fadeTo("fast", 0.70);
    },function(){
        if ($(this).hasClass('a')){
            return false;
        }else{
        $(this).fadeTo("slow", 0.99);
        }
	});

	
	$("a.gray").hover(function () {
	$(this).addClass("fadeBlue").fadeTo("slow", 0.5);
	    },function(){
        if ($(this).hasClass('a')){
            return false;
        }else{
	$(this).removeClass("fadeBlue").fadeTo("slow", 1);
        }
	});
	
	$(".bginputNews").hover(function(){
	$(this).find('.inputNews').fadeIn();
    },function(){
        if ($(this).hasClass('a')){
            return false;
        }else{
        $(this).find('.inputNews').fadeOut();
        }
	});
	
	$(".mapa").click(function(){
	$(".mapadosite").slideUp();
	});
	
	
	//Show the paging and activate its first link
	$(".paging").show();
	$(".paging a:first").addClass("active");
	
	//Get size of the image, how many images there are, then determin the size of the image reel.
	var imageWidth = $(".window").width();
	var imageSum = $(".image_reel img").size();
	var imageReelWidth = imageWidth * imageSum;
	
	//Adjust the image reel to its new size
	$(".image_reel").css({'width' : imageReelWidth});
	
	//Paging  and Slider Function
	rotate = function(){
		var triggerID = $active.attr("rel") - 1; //Get number of times to slide
		var image_reelPosition = triggerID * imageWidth; //Determines the distance the image reel needs to slide
	
		$(".paging a").removeClass('active'); //Remove all active class
		$active.addClass('active'); //Add active class (the $active is declared in the rotateSwitch function)
	
		//Slider Animation
		$(".image_reel").animate({
			left: -image_reelPosition
		}, 500 );
	
	}; 
	
	//Rotation  and Timing Event
	rotateSwitch = function(){
		play = setInterval(function(){ //Set timer - this will repeat itself every 7 seconds
			$active = $('.paging a.active').next(); //Move to the next paging
			if ( $active.length === 0) { //If paging reaches the end...
				$active = $('.paging a:first'); //go back to first
			}
			rotate(); //Trigger the paging and slider function
		}, 5000); //Timer speed in milliseconds (7 seconds)
	};
	
	rotateSwitch(); //Run function on launch
	
	//On Hover
	$(".image_reel a").hover(function() {
		clearInterval(play); //Stop the rotation
	}, function() {
		rotateSwitch(); //Resume rotation timer
	});	
	
	//On Click
	$(".paging a").click(function() {
		$active = $(this); //Activate the clicked paging
		//Reset Timer
		clearInterval(play); //Stop the rotation
		rotate(); //Trigger rotation immediately
		rotateSwitch(); // Resume rotation timer
		return false; //Prevent browser jump to link anchor
	});
	
});