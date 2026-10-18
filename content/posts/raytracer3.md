---
title: "Raytracer3"
date: 2021-03-07T22:11:50+11:00
draft: true
---
Preamble...

<!DOCTYPE HTML>
  <html>
  <body>
  <label>Select number of web workers: </label>
<select id="coreSelect">
</select>
<br>
  <textarea rows=15 cols=50 id="sceneTextArea">
  </textarea>
  <br>
      <select id="scenes" onChange="return setScene()">
          <option scene="0" value="Choose a scene">Choose a scene</option>
          <option scene="1" value="/rayTracerScenes/reflectionScene.yaml">Reflections</option>
          <option scene="1" value="/rayTracerScenes/tables.yaml">Table</option>
          <option scene="2" value="/rayTracerScenes/groups.yaml">Groups</option>
          <option scene="3" value="/rayTracerScenes/cylinders.yaml">Cylinders</option>
          <option scene="4" value="/rayTracerScenes/hippy.yaml">Hippy</option>
          <option scene="5" value="/rayTracerScenes/shadowPuppets.yaml">Shadow Puppets</option>
          <option scene="6" value="/rayTracerScenes/coverScene.yaml">Cover Scene</option>
          <option scene="7" value="/rayTracerScenes/christmas.yaml">Christmas</option>
          <option scene="8" value="/rayTracerScenes/globe.yaml">Globe</option>
          <option scene="9" value="/rayTracerScenes/skybox.yaml">Skybox</option>
          <option scene="9" value="/rayTracerScenes/hippyModels.yaml">Models (Hippy)</option>
      </select>
      <button id="gobutton">go!</button>
      <!-- <button id="testButton">test</button> -->
  <br>
  <button id="leftbutton">left</button>
  <button id="rightbutton">right</button>
  <br>
  <canvas id="canvas" tabindex="1"></canvas>
  <script id="jsscript" src="/js/RayTracer.wasm.js"></script>
  <script>
      var textarea = document.getElementById("sceneTextArea");
      var select = document.getElementById("coreSelect"); 
      Module["onRuntimeInitialized"] = function () {
          const logicalProcessors = window.navigator.hardwareConcurrency;
            var options = Array.from(new Array(logicalProcessors), (x, i) => i + 1);
            // console.log(options);
            for(var i = 0; i < options.length; i++) {
                var opt = options[i];
                var el = document.createElement("option");
                el.textContent = opt;
                el.value = opt;
                select.appendChild(el);
            }
            if(/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)){
            // true for mobile device
            select.selectedIndex = parseInt(logicalProcessors/2) - 1;
            }else{
            // false for not mobile device
            select.selectedIndex = parseInt(logicalProcessors) - 1;
            // document.write("not mobile device");
            }
          Module.canvas = (() => document.getElementById('canvas'))();
          var goButton = document.getElementById("gobutton");
          // var testButton = document.getElementById("testButton");
          goButton.addEventListener(
              "click", function() {
              // Module._mainf(textarea.value);
            //   const textCopy = textarea.value;
            // console.log(select.options[select.selectedIndex].value);
              Module.ccall('drawThreaded', null, ["string"], [textarea.value]);
                // Module.ccall('draw', null, ["string","number"], [textarea.value,select.options[select.selectedIndex].value]);
              // Module._test();
          }
          );
          //   testButton.addEventListener(
          //     "click", function() {
          //     Module._killWorker();
          //     }
          // );
          leftbutton.addEventListener(
              "click", function() {
              Module._moveLeft();
              }
          );
          rightbutton.addEventListener(
              "click", function() {
              Module._moveRight();
              }
          );
          document.getElementById('canvas').addEventListener(
              "click", function() {
                  document.getElementById('canvas').focus();
                //   Module.ccall('getModel', null, ["string"], ["/rayTracerModels/donut.obj"]);
              }
          );
      };
      function setScene(){
          // find the dropdown
          var ddl = document.getElementById("scenes");
          // find the selected option
          var selectedOption = ddl.options[ddl.selectedIndex];
          // find the attribute value
          var sceneValue = selectedOption.getAttribute("value");
          // find the textbox
          var textBox = document.getElementById("sceneTextArea");
          fetch(sceneValue)
          .then(response => response.text())
          .then((data) => {
          textBox.value = data
      })
      }
    //   var c = document.getElementById('canvas');
    //   c.addEventListener('keydown',this.check,false);
    //     function check(e) {
    //         alert(e.keyCode);
    //     }
  </script>
  </body>
  </html>
