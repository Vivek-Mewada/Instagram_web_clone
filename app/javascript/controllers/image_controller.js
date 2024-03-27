import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = [ "input", "video", "output" ]

  connect() {}

  readURL() {

    console.log("heloooooooooooooooooooooooooooooo")
    
    var input = this.inputTarget
    //   var output = this.outputTarget
    
    
    if ( input.files[0].type == 'video/mp4') {
      document.getElementsByClassName('imgBg')[0].innerHTML = `<video src='${(window.URL ? URL : webkitURL).createObjectURL(document.getElementById("upload_file").files[0])}'/>`      
    }
    else {
      document.getElementsByClassName('imgBg')[0].innerHTML = `<image src='${(window.URL ? URL : webkitURL).createObjectURL(document.getElementById("upload_file").files[0])}'/>`
   } 

  // if (input.files[0].type == 'image/jpeg') {
  //   const p = document.getElementsByClassName('imgBg')
  //   debugger
    //       var reader = new FileReader();
      
//       reader.onload = function () {
//         this.imageTarget.src = reader.result
//       } 
//       // debugger  
//   //   console.log("helooooooooooooooooooooooo")
//    reader.readAsDataURL(input.files[0]);
//  }
 }
}
