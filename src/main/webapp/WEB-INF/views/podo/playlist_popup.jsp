<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>PODO</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
 <!-- jQuery : Bootstrap JS 파일은 jQuery 라이브러리를 반드시 넣어줘야 함! -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
 <!-- Bootstrap JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/wavesurfer.js/1.4.0/wavesurfer.min.js"></script>

<style>        
html{
  height: 60%;
}



body{
  background-image: url("././resources/images/${music.malbumart}");
  background-size: 400px;
  font-family: "proxima-nova";
}

.clear{
  &:before,
  &:after{
    content: "";
    display: table;
  }
  
  &:after{
    clear: both;
  }
}

@keyframes opacityAni{
  0%{
    opacity: 0;
  }
  100%{
    opacity: 1;
  }
}

.phone{
  animation: opacityAni 400ms linear 50ms forwards;
  background: rgb(28,22,55);
  background: -moz-linear-gradient(top,  rgba(28,22,55,1) 0%, rgba(24,14,108,1) 34%, rgba(73,153,231,1) 88%, rgba(138,200,240,1) 100%);
  background: -webkit-linear-gradient(top,  rgba(28,22,55,1) 0%,rgba(24,14,108,1) 34%,rgba(73,153,231,1) 88%,rgba(138,200,240,1) 100%);
  background: linear-gradient(t	o bottom,  rgba(28,22,55,1) 0%,rgba(24,14,108,1) 34%,rgba(73,153,231,1) 88%,rgba(138,200,240,1) 100%);
  filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#1e1e28', endColorstr='#e8fefe',GradientType=0 ); */
  /* background-color: #1C1637; */
  color: white;
  border-radius: 3px;
  box-shadow: 0 2px 6px rgba(0,0,0,.4);
  height: 550px;
  left: 50%;
  opacity: 0;
  overflow: hidden;
  position: absolute;
  transform: translate(-50%,-50%);
  top: 50%;
  width: 320px;
}

.wavesurfer{
  box-sizing: border-box;
  cursor: pointer;
  height: 275px;
  margin-bottom: 30px;
  overflow: hidden;
  padding-top: 60px;
  pointer-events: none;
  position: relative;
  width: 100%;
  z-index: 1;
}

.wavesurfer__elem{
  height: 500px;
  left: 0;
  opacity: 0;
  position: absolute;
  transition: opacity 50ms linear;
  top: 0;
  width: 100%;
  z-index: 0;
  
  &.show{
    opacity: 1;
  }
}

.artist__image{
  box-shadow: 0 0 0 5px rgba(255,255,255,.1), 0 0 0 10px rgba(255,255,255,.1), 0 0 5px 20px rgba(255,255,255,.05);
  height: 140px;
  margin: 0 auto 34px auto;
  position: relative;
  transition: all 50ms ease-in;
  width: 140px;
  z-index: 2;
  
  &.play{
    box-shadow: 0 0 0 5px rgba(255,255,255,0), 0 0 0 10px rgba(255,255,255,0), 0 0 5px 20px rgba(255,255,255,0);
  }
}

.artist__image-url{
  background: url('././resources/images/${music.malbumart}') no-repeat left top;
  background-size: cover;
  height: 140px;
  width: 140px;
}

.time{
  color: rgba(255,255,255,.7);
  display: none;
  font-size: 14px;
  font-weight: 300;
  margin: 0 auto;
  pointer-events: none;
  text-align: center;
  width: 63px;
  
  @extend .clear;
  
  span{
    display: inline-block;
    float: left;
    width: 3px;
  }
  
  .time__minutes,
  .time__seconds{
    width: 30px;
  }
  
  .time__minutes{
    text-align: right;
  }
  
  .time__seconds{
    text-align: left;
  }
}

.progress{
  background: rgba(255,255,255,.2);
  bottom: 5px;
  display: none;
  height: 5px;
  left: 0;
  pointer-events: none;
  position: absolute;
  width: 100%;
}

.progress__button{
  background-color: #fff;
  border-radius: 50%;
  height: 15px;
  left: 10px;
  position: absolute;
  top: -5px;
  transform: translateX(-50%);
  width: 15px;
  z-index: 1;
}

.progress__indicator{
  background: -moz-linear-gradient(left,  rgba(255,255,255,0) 0%, rgba(255,255,255,0.6) 100%);
  background: -webkit-linear-gradient(left,  rgba(255,255,255,0) 0%,rgba(255,255,255,0.6) 100%);
  background: linear-gradient(to right,  rgba(255,255,255,0) 0%,rgba(255,255,255,0.6) 100%);
  filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#00ffffff', endColorstr='#99ffffff',GradientType=1 );
  height: 3px;
  left: 0;
  position: absolute;
  top: 1px;
  width: 10px;
  z-index: 0;
}

@keyframes artistNameAni{
  0%{
    transform: translateY(40px) scale(.8);
  }
  100%{
    transform: translateY(0) scale(1);
  }
}

.artist__name{
  animation: artistNameAni 400ms linear 50ms forwards;
  margin-bottom: 30px;
  position: relative;
  text-align: center;
  transform: translateY(40px) scale(.8);
  
  h1{
    color: rgba(255,255,255,.7);
    font-size: 16px;
    font-weight: 100;
    margin: 0;
    text-transform: uppercase;
  }
  
  p{
    color: #fff;
    font-size: 18px;
    font-weight: 300;
    margin: 0 0 5px 0;
  }
}

.love{
  color: rgba(255,255,255,.5);
  font-size: 18px;
  left: 30px;
  position: absolute;
  top: 10px;
}

.share{
  border: 1px solid rgba(255,255,255,.6);
  border-radius: 0%;
  height: 5px;
  position: absolute;
  right: 35px;
  top: 20px;
  width: 5px;
  
  &:before,
  &:after{
    border: 1px solid rgba(255,255,255,.6);
    border-radius: 0%;
    content: "";
    height: 5px;
    position: absolute;
    top: -1px;
    width: 5px;
  }
  
  &:before{
    left: -10px;
  }
  
  &:after{
    right: -10px;
  }
}

.controls{
  text-align: center;
}

@keyframes buttonAni{
  0%{
    transform: translateY(120px);
  }
  100%{
    transform: translateY(0);
  }
}

.button__play{
  animation: buttonAni 400ms cubic-bezier(.48,.18,.44,.97) 50ms forwards;
  background-color: rgba(255,255,255,.1);
  border: 2px solid #fff;
  border-radius: 50%;
  cursor: pointer;
  height: 80px;
  outline: none;
  overflow: hidden;
  position: relative;
  transform: translateY(120px);
  width: 80px;  
}

.button__play-iconplay{
  border-color: transparent transparent transparent #fff;
  border-style: solid;
  border-width: 13px 0 13px 20px;
  height: 0;
  left: 31px;
  position: absolute;
  top: 25px;
  width: 0;
}
.button__play:hover, .button__next:hover, .button__prev:hover{
  background-color: rgba(0, 0, 0, .3);
}

.button__play-iconpause{
  display: none;
  height: 24px;
  left: 28px;
  position: absolute;
  top: 25px;
  width: 19px;
  
  &:before,
  &:after{
    background: #fff;
    content: "";
    display: block;
    height: 24px;
    position: absolute;
    top: 0;
    width: 6px;
  }
  
  &:before{
    left: 0;
  }
  
  &:after{
    left: 13px;
  }
}

.button__loader{
  background: rgba(255,255,255,.5);
  bottom: 0;
  height: 0;
  left: 0;
  position: absolute;
  width: 100%;
}

.button__prev,
.button__next{
  background: none;
  border: 1px solid #fff;
  border-radius: 50%;
  height: 50px;
  margin: 0 8px;
  position: relative;
  top: 15px;
  transform: translateY(120px);
  vertical-align: top;
  width: 50px;
  
  &:before{
    border-style: solid;
    content: "";
    height: 0;
    position: absolute;
    top: 16px;
    width: 0;
  }
  
  &:after{
    background: #fff;
    border-radius: 1px;
    content: "";
    height: 14px;
    position: absolute;
    top: 17px;
    width: 2px;
  }
}

.button__prev{
  animation: buttonAni 400ms cubic-bezier(.48,.18,.44,.97) 50ms forwards;
  
  &:before{
    border-color: transparent #fff transparent transparent;
    border-width: 8px 12px 8px 0;
    right: 17px;
  }
  
  &:after{
    left: 14px;
  }
}

.button__next{
  animation: buttonAni 400ms cubic-bezier(.48,.18,.44,.97) 50ms forwards;
  
  &:before{
    border-color: transparent transparent transparent #fff;
    border-width: 8px 0 8px 12px;
    left: 17px;
  }
  
  &:after{
    right: 14px;
  }
}

.hint{
  bottom: 20px;
  color: rgba(255,255,255,.5);
  font-size: 16px;
  left: 0;
  position: absolute;
  text-align: center;
  width: 100%;
}

.recordplayer{
  height: 180px;
  left: 70px;
  position: absolute;
  transform: scale(.7);
  transition: all 170ms ease-in;
  top: 40px;
  width: 180px;
  
  &.play{
    transform: scale(1);
  }
}

@keyframes discAni{
  from{
    transform: rotate(0deg);
  }
  to{
    transform: rotate(360deg);
  }
}

.recordplayer__disc{
  animation: discAni 6s infinite linear forwards;
  border: 2px solid #fff;
  border-radius: 50%;
  box-sizing: border-box;
  height: 180px;
  left: 0;
  position: absolute;
  top: 0;
  width: 180px;
}

.recordplayer__disc-stripe1{
  height: 30px;
  left: 39px;
  overflow: hidden;
  position: absolute;
  top: 5px;
  width: 100px;
  
  &:before{
    border: 3px solid rgba(255,255,255,.5);
    border-radius: 50%;
    box-sizing: border-box;
    content: "";
    display: block;
    height: 170px;
    left: -35px;
    position: absolute;
    top: 0;
    width: 170px;
  }
}

.recordplayer__disc-stripe2{
  bottom: 5px;
  height: 30px;
  left: 64px;
  overflow: hidden;
  position: absolute;
  width: 50px;
  
  &:before{
    border: 3px solid rgba(255,255,255,.5);
    border-radius: 50%;
    box-sizing: border-box;
    content: "";
    display: block;
    height: 170px;
    left: -60px;
    position: absolute;
    top: -140px;
    width: 170px;
  }
}

/*
 * EMBED STYLING
*/
@media (max-width: 800px){
	html,
	body{
		height: 600px;
		overflow: hidden;
		width: 800px;
	}
}



</style>

<body onload="window.resizeTo(400,700)">
<div style="width: 100%; height: 100%; background-color: black; opacity: 0.5;
			position: absolute; top: 0; left: 0; z-index: -1;"></div>
<div class="phone">
  <div class="player">
    <div class="wavesurfer">
      <div class="recordplayer">
        <div class="recordplayer__disc">
          <div class="recordplayer__disc-stripe1"></div>
          <div class="recordplayer__disc-stripe2"></div>
        </div>
      </div>
      <div class="artist__image">
        <div class="artist__image-url"></div>
      </div>

      <div class="time">
        <span class="time__minutes"></span>
        <span>:</span>
        <span class="time__seconds"></span>
      </div>
      <div class="progress">
        <div class="progress__button"></div>
        <div class="progress__indicator"></div>
      </div>
    </div>
    
    <div id="wavesurfer" class="wavesurfer__elem"></div>
    
    <div class="artist__name">
      <p style="color: white;">${music.martist }</p>
      <h1 style="color: white;">${music.mtitle }</h1>
    </div>
    
    <div class="controls">
      <button class="button__prev">
      	<img alt="button__prev" src="././resources/images/prev_button.png" style="width: 20px; height: 20px;">
      </button>
      <button id="play" class="button__play load">
        <span class="button__play-iconplay">
        </span>
        <span class="button__play-iconpause">
       		<img alt="button__play-iconpause" src="././resources/images/pause_button2.png" style="width: 20px; height: 20px;">
        </span>
        <span class="button__loader"></span>
      </button>
      <button class="button__next">
      	<img alt="button__next" src="././resources/images/next_button.png" style="width: 20px; height: 20px;">
      </button>
    </div>
  </div>
</div>

<div class="hint">Press play</div>

<script>
$(document).ready(function(){
	
	var wavesurfer = WaveSurfer.create({
	    barWidth: 1,
	    container: '#wavesurfer',
	    cursorWidth: 0,
	    dragSelection: true,
	    height: 500,
	    hideScrollbar: true,
	    interact: true,
	    normalize: true,
	    waveColor: 'rgba(255,255,255,.05)',
	    progressColor: 'rgba(255,255,255,.15)'
	});

	$('.player').on('click', '#play', function(){
	  if( $(this).hasClass('load') ){
	    $(this).removeClass('load');
	    wavesurfer.load('././resources/mp3/test01.mp3');
	  } else {
	    wavesurfer.playPause();
	  }
	});
	
	var m,
	    s;

	function getMinutes( convTime ){
	  convTime = Number(convTime);
	  m = Math.floor(convTime% 3600 / 60);
	  return ((m < 10 ? "0" : "") + m);
	}

	function getSeconds( convTime ){
	  convTime = Number(convTime);
	  s = Math.floor(convTime % 3600 % 60);
	  return ((s < 10 ? "0" : "") + s);
	}

	var totalTime,
	    timeJump,
	    currentTime,
	    currentTimeJump;

	wavesurfer.on('ready', function(){
	  totalTime = wavesurfer.getDuration();
	  timeJump = 300 / totalTime;
	  $('.wavesurfer__elem').addClass('show');
	  $('.button__loader').fadeOut();
	  $('.time__minutes').text( getMinutes( totalTime ) );
	  $('.time__seconds').text( getSeconds( totalTime ) );
	  $('.time, .progress').fadeIn();
	  
	  wavesurfer.play();
	});

	function progressJump(){
	  currentTime = wavesurfer.getCurrentTime();
	  currentTimeJump = currentTime * timeJump + 10;
	  $('.progress__button').css({ left: currentTimeJump+'px' });
	  $('.progress__indicator').css({ width: currentTimeJump+'px' });
	  
	  $('.time__minutes').text( getMinutes( currentTime ) );
	  $('.time__seconds').text( getSeconds( currentTime ) );
	}

	wavesurfer.on('audioprocess', function(){
	  progressJump();
	});

	wavesurfer.on('pause', function(){
	  $('.button__play-iconplay').fadeIn();
	  $('.button__play-iconpause').fadeOut();
	  $('.recordplayer').removeClass('play');
	  $('.recordplayer__disc').removeClass('animate');
	  $('.artist__image').removeClass('play');
	});

	wavesurfer.on('play', function(){
	  $('.button__play-iconplay').fadeOut();
	  $('.button__play-iconpause').fadeIn();
	  $('.recordplayer').addClass('play');
	  $('.recordplayer__disc').addClass('animate');
	  $('.artist__image').addClass('play');
	});

	wavesurfer.on('loading', function(event){
	  $('.button__loader').css({ height: event+'px' });
	});

	wavesurfer.on('seek', function(event){
	  progressJump();
	});

});

</script>

</body>
</html>

