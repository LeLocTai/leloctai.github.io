<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Le Loc Tai</title>
    {{>style}}
    <!--build:css /asset/scss/style.css-->
    <link rel="stylesheet" href="scss/style.css">
    <!--endbuild-->
    
    <!--build:js /asset/script.js defer-->
    <script defer src="Translucentwebgl/unityProgress.js"></script>
    <script defer src="js/script.js"></script>
    <!--endbuild-->
</head>

<body>
    {{>nav}}

    <div class="group">
        <h1 class="text">Translucent Image</h1>
        <h2 class="text">Create <span class="depth text">depth</span> and <span class="colorful text">vitality</span> in your game<br>at minimal cost</h2>
        <a class="cta" href="#demo">Play the demo</a>
    </div>
    <div class="group"></div>
    <div class="group" id="demo">
            <div id="canvas-wrapper">
                <canvas class="emscripten" id="canvas" oncontextmenu="event.preventDefault()" height="400px" width="600px"></canvas>
                <div id="loadingBox">
                    <img id="spinner" src="images/ajax-loader.gif" style="margin: 0 auto" />
                    <p id="loadingInfo">Loading...</p>                    
                </div>
            </div>
        <a class="cta" href="Translucentwebgl/TranslucentImage.apk">Get the APK</a>
    </div>
    
    {{>footer}}

    
    <script type='text/javascript'>
    /*Release*/
    var Module = {
        TOTAL_MEMORY: 268435456,
        errorhandler: null, // arguments: err, url, line. This function must return 'true' if the error is handled, otherwise 'false'
        compatibilitycheck: null,
        backgroundColor: "#FFFFFF",
        dataUrl: "Translucentwebgl/Release/Translucentwebgl.data",
        codeUrl: "Translucentwebgl/Release/Translucentwebgl.js",
        asmUrl: "Translucentwebgl/Release/Translucentwebgl.asm.js",
        memUrl: "Translucentwebgl/Release/Translucentwebgl.mem",

    };

  //   /* Dev*/
  //   var Module = {
  //   TOTAL_MEMORY: 268435456,
  //   errorhandler: null,         // arguments: err, url, line. This function must return 'true' if the error is handled, otherwise 'false'
  //   compatibilitycheck: null,
  //   dataUrl: "Translucentwebgl/Development/Translucentwebgl.data",
  //   codeUrl: "Translucentwebgl/Development/UnityEngine.js",
  //   memUrl: "Translucentwebgl/Development/UnityEngine.mem",
  //   dynamicLibraries: ["Translucentwebgl/Development/Translucentwebgl.js"],
  // };
    </script>
    <script src="Translucentwebgl/Release/UnityLoader.js"></script>
    <!-- <script src="Translucentwebgl/Development/UnityLoader.js"></script> -->

    {{>script}}
</body>

</html>
