<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Le Loc Tai</title>
    {{>style}}
    <!-- build:js /assets/webglLoader.min.js defer-->
    <script defer src="js/script.js"></script>
    <script defer src="Translucentwebgl/TemplateData/UnityProgress.js"></script>
    <!-- endbuild -->
</head>

<body>
    {{>nav}}

    <div class="bg">
        <header class="hero-text">Translucent Image</header>
    </div>
    

    
    <script type='text/javascript'>
    /*Release*/
    var Module = {
        TOTAL_MEMORY: 268435456,
        errorhandler: null, // arguments: err, url, line. This function must return 'true' if the error is handled, otherwise 'false'
        compatibilitycheck: null,
        dataUrl: "Translucentwebgl/Release/Translucentwebgl.data",
        codeUrl: "Translucentwebgl/Release/Translucentwebgl.js",
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
    <!-- <script src="Translucentwebgl/Release/UnityLoader.js"></script> -->
    <!-- <script src="Translucentwebgl/Development/UnityLoader.js"></script> -->

    {{>script}}
</body>

</html>
