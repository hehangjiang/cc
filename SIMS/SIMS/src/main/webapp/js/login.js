
$(document).ready(function(){

	var login = $('#loginform');
	var recover = $('#recoverform');
    var register=$('#registerform');
	var speed = 400;

	$('#to-recover').click(function(){
		login.fadeTo(speed,0.01).css('z-index','100');
        register.fadeTo(speed,0.01).css('z-index','100');
		recover.fadeTo(speed,1).css('z-index','200');
	});

	$('#to-login').click(function(){
		recover.fadeTo(speed,0.01).css('z-index','100');
        register.fadeTo(speed,0.01).css('z-index','100');
		login.fadeTo(speed,1).css('z-index','200');
	});
	$('#recover-to-login').click(function(){
		recover.fadeTo(speed,0.01).css('z-index','100');
		register.fadeTo(speed,0.01).css('z-index','100');
		login.fadeTo(speed,1).css('z-index','200');
	});
    $('#to-register').click(function(){
        recover.fadeTo(speed,0.01).css('z-index','100');
        login.fadeTo(speed,0.01).css('z-index','100');
        register.fadeTo(speed,1).css('z-index','200');
    });
    

});