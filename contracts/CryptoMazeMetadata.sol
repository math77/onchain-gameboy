//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import '@openzeppelin/contracts/access/Ownable.sol';

import "./sounds/CryptoMazeSounds1.sol";
import "./sounds/CryptoMazeSounds2.sol";
import "./sounds/CryptoMazeSounds3.sol";


import "./fonts/CryptoMazeFont.sol";

import { Base64 } from "./libraries/Base64.sol";


/*


      ___           ___                       ___                       ___           ___           ___           ___           ___     
     /\__\         /\  \                     /\  \                     /\  \         /\  \         /\  \         /\__\         /\__\    
    /:/  /        /::\  \         ___       /::\  \       ___         /::\  \       |::\  \       /::\  \       /::|  |       /:/ _/_   
   /:/  /        /:/\:\__\       /|  |     /:/\:\__\     /\__\       /:/\:\  \      |:|:\  \     /:/\:\  \     /:/:|  |      /:/ /\__\  
  /:/  /  ___   /:/ /:/  /      |:|  |    /:/ /:/  /    /:/  /      /:/  \:\  \   __|:|\:\  \   /:/ /::\  \   /:/|:|  |__   /:/ /:/ _/_ 
 /:/__/  /\__\ /:/_/:/__/___    |:|  |   /:/_/:/  /    /:/__/      /:/__/ \:\__\ /::::|_\:\__\ /:/_/:/\:\__\ /:/ |:| /\__\ /:/_/:/ /\__\
 \:\  \ /:/  / \:\/:::::/  /  __|:|__|   \:\/:/  /    /::\  \      \:\  \ /:/  / \:\~~\  \/__/ \:\/:/  \/__/ \/__|:|/:/  / \:\/:/ /:/  /
  \:\  /:/  /   \::/~~/~~~~  /::::\  \    \::/__/    /:/\:\  \      \:\  /:/  /   \:\  \        \::/__/          |:/:/  /   \::/_/:/  / 
   \:\/:/  /     \:\~~\      ~~~~\:\  \    \:\  \    \/__\:\  \      \:\/:/  /     \:\  \        \:\  \          |::/  /     \:\/:/  /  
    \::/  /       \:\__\          \:\__\    \:\__\        \:\__\      \::/  /       \:\__\        \:\__\         |:/  /       \::/  /   
     \/__/         \/__/           \/__/     \/__/         \/__/       \/__/         \/__/         \/__/         |/__/         \/__/    


Hey you, looking at this code... if you have ideas how I can write better solidity code, don't be 
shy and send me a DM on twitter (https://twitter.com/stargeistt). I'm still learning and collaboration is always good. 
To those who help me I promise that when we meet IRL you will get a hug and maybe I'll buy you 
a coffee! (don't worry, I'm very cool and have a super hot curly hair hahaha).




--------
Warning:

Since OpenSea and other platforms require animated content for the animation_url property to be 
provided via an https API this contract uses a proxy to fetch the data stored onchain and serve 
it to the animation_url property. In any case all token content is generated and stored onchain, 
using the proxy only as a "workaround" given the limitations.
*/


interface ICryptoMazeMetadata {
  function tokenURI(uint256 tokenId)
    external
    view
    returns (string memory);
}


contract CryptoMazeMetadata is Ownable, ICryptoMazeMetadata {

    address private _addressSounds1;
    address private _addressSounds2;
    address private _addressSounds3;

    address private _addressFont;

    string private _proxyUri = "https://cryptomaze.herokuapp.com/";

    string public jsScript = unicode"let newMaze,current,goal,size=300,rowsCols=20,isOn=!1,introDone=!1,playerWon=!1;const defCellColor='#141414',strokeColor='#FFF',btnDownload=document.querySelector('#download'),btnStart=document.querySelector('#start'),btnPlay=document.querySelector('#play'),btnUp=document.querySelector('#up'),btnLeft=document.querySelector('#left'),btnRight=document.querySelector('#right'),btnDown=document.querySelector('#down'),intro=document.querySelector('.intro'),maze=document.querySelector('.maze'),banner=document.querySelector('.banner'),wonn=document.querySelector('#won');function generateMaze(){isOn&amp;&amp;introDone&amp;&amp;(banner.style.display='none',wonn.style.display='none',maze.style.display='flex',btnPlay.disabled=!0,(newMaze=new Maze(size,rowsCols,rowsCols)).setup(),newMaze.draw())}function moveWithKeys(t,e){if(!generationComplete||!isOn)return;let l=t.key,n=current.rowNum,o=current.colNum;switch(l){case'ArrowUp':forUp(n,o);break;case'ArrowRight':forRight(n,o);break;case'ArrowDown':forDown(n,o);break;case'ArrowLeft':forLeft(n,o)}}function forLeft(t,e){if(!current.walls.leftWall){let l=current,n=newMaze.grid[t][e-1];current=n,l.cellToPaint(),newMaze.draw(),steps.play(),current.highlight(newMaze.columns),current.goal&amp;&amp;won()}}function forUp(t,e){if(!current.walls.topWall){let l=current,n=newMaze.grid[t-1][e];current=n,l.cellToPaint(),newMaze.draw(),steps.play(),current.highlight(newMaze.columns),current.goal&amp;&amp;won()}}function forRight(t,e){if(!current.walls.rightWall){let l=current,n=newMaze.grid[t][e+1];current=n,l.cellToPaint(),newMaze.draw(),steps.play(),current.highlight(newMaze.columns),current.goal&amp;&amp;won()}}function forDown(t,e){if(!current.walls.bottomWall){let l=current,n=newMaze.grid[t+1][e];current=n,l.cellToPaint(),newMaze.draw(),steps.play(),current.highlight(newMaze.columns),current.goal&amp;&amp;won()}}function won(){victory.play(),maze.style.display='none',wonn.style.display='block',playerWon=!0,btnDownload.disabled=!1,btnDownload.style.pointerEvents='auto'}function getRandomInt(t,e){return t=Math.ceil(t),e=Math.floor(e),Math.floor(Math.random()*(e-t+1)+t)}document.addEventListener('keydown',moveWithKeys),btnPlay.addEventListener('click',function(){isOn&amp;&amp;(newMaze=null,playerWon=!1,soundBtn.play(),generateMaze(),soundPreMaze.play(),btnDownload.removeAttribute('download'),btnDownload.removeAttribute('href'))}),intro.addEventListener('animationend',function(){intro.style.display='none',banner.style.display='block',soundIntro.play(),btnPlay.disabled=!1,introDone=!0},!1),btnStart.addEventListener('click',function(){isOn?(newMaze=null,offDevice.play(),intro.style.display='none',banner.style.display='none',maze.style.display='none',wonn.style.display='none',isOn=!1,introDone=!1,playerWon=!1,soundBtn.play(),btnDownload.disabled=!0,btnDownload.style.pointerEvents='none'):(intro.style.display='block',isOn=!0,soundBtn.play())}),btnUp.addEventListener('click',function(){if(!generationComplete||!isOn)return;forUp(current.rowNum,current.colNum)}),btnDown.addEventListener('click',function(){if(!generationComplete||!isOn)return;forDown(current.rowNum,current.colNum)}),btnRight.addEventListener('click',function(){if(!generationComplete||!isOn)return;forRight(current.rowNum,current.colNum)}),btnLeft.addEventListener('click',function(){if(!generationComplete||!isOn)return;forLeft(current.rowNum,current.colNum)}),btnDownload.addEventListener('click',function(){if(null!==newMaze&amp;&amp;playerWon){var t=maze.toDataURL('image/jpeg',1);btnDownload.download='artwork.jpeg',btnDownload.href=t}});let ctx=maze.getContext('2d'),generationComplete=!1;class Maze{constructor(t,e,l){this.size=t,this.columns=l,this.rows=e,this.grid=[],this.stack=[]}setup(){generationComplete=!1;for(let t=0;t&lt;this.rows;t++){let e=[];for(let l=0;l&lt;this.columns;l++){let n=new Cell(t,l,this.grid,this.size);e.push(n)}this.grid.push(e)}current=this.grid[0][0],this.grid[this.rows-1][this.columns-1].goal=!0}draw(){maze.width=this.size,maze.height=this.size,maze.style.background=defCellColor,current.visited=!0;for(let t=0;t&lt;this.rows;t++)for(let e=0;e&lt;this.columns;e++){this.grid[t][e].show(this.size,this.rows,this.columns)}let t=current.checkNeighbours();if(t)t.visited=!0,this.stack.push(current),current.highlight(this.columns),current.removeWalls(current,t),current=t;else if(this.stack.length&gt;0){let t=this.stack.pop();(current=t).highlight(this.columns)}if(0===this.stack.length)return generationComplete=!0,btnPlay.disabled=!1,void maze.focus();window.requestAnimationFrame(()=&gt;{this.draw()})}}class Cell{constructor(t,e,l,n){this.rowNum=t,this.colNum=e,this.visited=!1,this.played=!1,this.playedColor='',this.walls={topWall:!0,rightWall:!0,bottomWall:!0,leftWall:!0},this.goal=!1,this.parentGrid=l,this.parentSize=n}checkNeighbours(){let t=this.parentGrid,e=this.rowNum,l=this.colNum,n=[],o=0!==e?t[e-1][l]:void 0,r=l!==t.length-1?t[e][l+1]:void 0,i=e!==t.length-1?t[e+1][l]:void 0,a=0!==l?t[e][l-1]:void 0;if(o&amp;&amp;!o.visited&amp;&amp;n.push(o),r&amp;&amp;!r.visited&amp;&amp;n.push(r),i&amp;&amp;!i.visited&amp;&amp;n.push(i),a&amp;&amp;!a.visited&amp;&amp;n.push(a),0!==n.length){return n[Math.floor(Math.random()*n.length)]}}drawTopWall(t,e,l,n,o){ctx.beginPath(),ctx.moveTo(t,e),ctx.lineTo(t+l/n,e),ctx.stroke()}drawRightWall(t,e,l,n,o){ctx.beginPath(),ctx.moveTo(t+l/n,e),ctx.lineTo(t+l/n,e+l/o),ctx.stroke()}drawBottomWall(t,e,l,n,o){ctx.beginPath(),ctx.moveTo(t,e+l/o),ctx.lineTo(t+l/n,e+l/o),ctx.stroke()}drawLeftWall(t,e,l,n,o){ctx.beginPath(),ctx.moveTo(t,e),ctx.lineTo(t,e+l/o),ctx.stroke()}highlight(t){let e=this.colNum*this.parentSize/t+1,l=this.rowNum*this.parentSize/t+1;ctx.fillStyle='#FFF',ctx.fillRect(e,l,this.parentSize/t-3,this.parentSize/t-3)}cellToPaint(){this.played=!0,this.playedColor=colors[getRandomInt(0,colors.length-1)]}removeWalls(t,e){let l=t.colNum-e.colNum;1===l?(t.walls.leftWall=!1,e.walls.rightWall=!1):-1===l&amp;&amp;(t.walls.rightWall=!1,e.walls.leftWall=!1);let n=t.rowNum-e.rowNum;1===n?(t.walls.topWall=!1,e.walls.bottomWall=!1):-1===n&amp;&amp;(t.walls.bottomWall=!1,e.walls.topWall=!1)}show(t,e,l){let n=this.colNum*t/l,o=this.rowNum*t/e;ctx.strokeStyle=strokeColor,ctx.fillStyle=defCellColor,ctx.lineWidth=1,this.walls.topWall&amp;&amp;this.drawTopWall(n,o,t,l,e),this.walls.rightWall&amp;&amp;this.drawRightWall(n,o,t,l,e),this.walls.bottomWall&amp;&amp;this.drawBottomWall(n,o,t,l,e),this.walls.leftWall&amp;&amp;this.drawLeftWall(n,o,t,l,e),this.visited&amp;&amp;ctx.fillRect(n+1,o+1,t/l-2,t/e-2),this.goal&amp;&amp;(ctx.fillStyle='rgb(240, 29, 7)',ctx.fillRect(n+1,o+1,t/l-2,t/e-2)),this.played&amp;&amp;(ctx.fillStyle=this.playedColor,ctx.fillRect(n+1,o+1,t/l-2,t/e-2))}}</script>";
    string public styles = "');}h1,h2,h4,p{font-family:'Ka'}h1,h4,p{color:#fff}.screen{display:flex;justify-content:center;align-items:center;background-color:#000;height:320px;width:400px;border-radius:4px}.maze{display:none}.intro{display:none;animation:pulse 5s}.banner{display:none;text-align:center}.banner h1{font-size:3.4rem}.controls{display:flex;justify-content:space-around;align-items:center;margin-top:40px}.buttons{text-align:center}.buttons button{padding:18px;border-radius:5px;box-shadow:0 3px 5px rgba(0,0,0,.18);cursor:pointer;background-color:#fff;text-decoration:none;border:none}#screenExt{display:flex;align-items:center;justify-content:center}#won{display:none;text-align:center}#download{background-color:#2c2c2e;color:#fff;padding:5px 45px;border-radius:25px;box-shadow:0 3px 5px rgba(0,0,0,.18);text-decoration:none;pointer-events:none}@keyframes pulse{0%{color:#001f3f}100%{color:#ff4136}}";
    string public consoleHardware = "<svg version='2.0' encoding='utf-8' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink' preserveAspectRatio='xMinYMin meet' viewBox='0 0 600 600'><rect width='100%' height='100%' fill='transparent'/><rect id='console' x='45' y='20' width='450' height='560' rx='5'/><foreignObject x='45' y='45' width='450' height='520'><div xmlns='http://www.w3.org/1999/xhtml' id='screenExt'><div class='screen' xmlns='http://www.w3.org/1999/xhtml'><!--Use the display properties. There are probably ways to do this better. See next time.--><div class='intro' xmlns='http://www.w3.org/1999/xhtml'><h2>Loading...</h2></div><div class='banner'><h1>Crypto<br/>Maze</h1><h4>Ready to play?</h4></div><div id='won'><h1>You are so <span style='color: red;'>hot</span></h1><h4>You won!</h4><p style='font-size: 0.9rem; margin-top: 5px;'>Press gray button<br/> to download artwork</p></div><canvas class='maze' xmlns='http://www.w3.org/1999/xhtml'/></div></div><div class='controls' xmlns='http://www.w3.org/1999/xhtml'><div class='buttons'><button id='start' style='border-radius: 50%; background-color: #E40027; margin-right: 15px;'></button><button id='play' style='border-radius: 50%; background-color: #F8D034;' disabled='true'></button></div><div class='buttons'><button id='up'></button><br/><button id='left' style='margin-right: 30px;'></button><button id='right'></button><br/><button id='down'></button></div></div><div style='text-align: center; margin-top: 15px;' xmlns='http://www.w3.org/1999/xhtml'><a id='download' href=''></a></div></foreignObject><style>@font-face{font-family: 'Ka'; src: url('";
    string[] public hardwareColors = ["#fff44f", "#9acd32","#006adf","#cd56ff","#ffa800"];

    string[5][7] artColorsFive = [
        ["#0affc2","#00ccf5","#ff7700","#f50076","#ffcf00"],
        ["#00ff7f","#00ff94","#00ffa9","#00ffbf","#00ffd4"],
        ["#d924f9","#bc20f9","#9d1df8","#8616f7","#6d12f6"],
        ["#0d8fff","#0cbce8","#00ffef","#0ce89b","#0dff66"],
        ["#f6511d","#ffb400","#00a6ed","#7fb800","#e27396"],
        ["#66cee1","#10d183","#fff047","#e77b23","#987ec9"],
        ["#ffe5ec","#ffc2d1","#ffb3c6","#ff8fab","#fb6f92"]
    ];

    string[2][3] artColorsTwo = [
        ["#00f59b","#7014f2"],
        ["#2fff00","#ff0062"],
        ["#ffff00","#00ffa1"]
    ];


    constructor(address addressSounds1, address addressSounds2, address addressSounds3, address addressFont) Ownable() {
        _addressSounds1 = addressSounds1;
        _addressSounds2 = addressSounds2;
        _addressSounds3 = addressSounds3;
        _addressFont = addressFont;
    }

    function random(string memory input) internal pure returns (uint256) {
        return uint256(keccak256(abi.encodePacked(input)));
    }

    function makeSvg(uint256 tokenId) internal view returns (string memory) {
        uint256 randN = random(string(abi.encodePacked("HARDWARECOLORS", toString(tokenId))));
        string memory colorNumber = hardwareColors[randN % hardwareColors.length];

        return string(abi.encodePacked(consoleHardware, CryptoMazeFont(_addressFont).font(), styles, "#console{fill:", colorNumber, ";}</style>"));
    }

    function genScript(uint256 tokenId) internal view returns (string memory) {
        uint256 randN = random(string(abi.encodePacked("ARTCOLORS", toString(tokenId))));
        string memory output = string(abi.encodePacked("const steps=new Audio('", CryptoMazeSounds1(_addressSounds1).stepsSound(), "');const victory=new Audio('", CryptoMazeSounds3(_addressSounds3).victorySound(), "');const offDevice=new Audio('", CryptoMazeSounds2(_addressSounds2).turnoffSound(), "');const soundBtn=new Audio('", CryptoMazeSounds2(_addressSounds2).buttonSound(), "');const soundIntro= new Audio('", CryptoMazeSounds1(_addressSounds1).introSound(), "');const soundPreMaze=new Audio('", CryptoMazeSounds1(_addressSounds1).introMazeSound(), "');"));

        //42 the answer...
        if (randN % 42 == 0) {
            string[2] memory colors = artColorsTwo[randN%artColorsTwo.length];
            return string(abi.encodePacked("<script>const colors=['", colors[0], "','", colors[1], "'];", output, jsScript));
        }

        string[5] memory colors = artColorsFive[randN%artColorsFive.length];
        return string(abi.encodePacked("<script>const colors=['", colors[0], "','", colors[1], "','", colors[2], "','", colors[3], "','", colors[4], "'];", output, jsScript));
    }

    function tokenDataInHTML(uint256 tokenId) public view returns (string memory) {
        return string(abi.encodePacked("<html><head><meta charset=\'UTF-8\'><style>html,body,svg{margin:0;padding:0; height:100%;text-align:center;}</style></head><body>", makeSvg(tokenId), genScript(tokenId),"</svg></body></html>"));
    }

  	function tokenURI(uint256 tokenId) external view override returns (string memory) {
          string memory animationUrl;

          if (bytes(_proxyUri).length == 0) {
              animationUrl = string(abi.encodePacked("data:text/html;charset=utf-8,", tokenDataInHTML(tokenId)));
          } else {
              animationUrl = string(abi.encodePacked(_proxyUri, toString(tokenId), ".html"));
          }

          return string(
              abi.encodePacked(
                  'data:application/json;base64,',
                  Base64.encode(
                      abi.encodePacked(
                          '{"name":"CryptoMaze #',
                          toString(tokenId),
                          '","description": "Maze art-game stored onchain. Play, have fun and enjoy the sounds.", "animation_url":"',
                          animationUrl,
                          '","image": "data:image/svg+xml;base64,',
                          Base64.encode(abi.encodePacked(makeSvg(tokenId), '</svg>')),
                          '"}'
                          ))));
  	}

    // "workaround", given the plataforms limitations.
    function setProxyUri(string memory proxyUri) public onlyOwner {
        _proxyUri = proxyUri;
    }

    function toString(uint256 value) internal pure returns (string memory) {
        // Inspired by OraclizeAPI's implementation - MIT license
        // https://github.com/oraclize/ethereum-api/blob/b42146b063c7d6ee1358846c198246239e9360e8/oraclizeAPI_0.4.25.sol

        if (value == 0) {
          return "0";
        }
        uint256 temp = value;
        uint256 digits;
        while (temp != 0) {
          digits++;
          temp /= 10;
        }
        bytes memory buffer = new bytes(digits);
        while (value != 0) {
          digits -= 1;
          buffer[digits] = bytes1(uint8(48 + uint256(value % 10)));
          value /= 10;
        }
        return string(buffer);
    }
}