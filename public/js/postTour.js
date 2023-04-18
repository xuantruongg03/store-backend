document.getElementById("uploadExcel").addEventListener("change", function () {
  var file = this.files[0];
  if (file) {
    document.getElementById('box').innerHTML = `<div class="absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2 flex flex-col jusitfy-center items-center"><label class="my-3 text-lg">${file.name}</label></div>`;
  }
  
});
