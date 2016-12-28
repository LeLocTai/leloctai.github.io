function UnityProgress(dom) {
    this.message = "";

    this.SetProgress = function(progress) {};
    this.SetMessage = function(message) {
        document.getElementById("loadingInfo").innerHTML = message;
    };
    this.Clear = function() {
        document.getElementById("loadingBox").style.display = "none";
    };
    this.Update = function() {};
}
