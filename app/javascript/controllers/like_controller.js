import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

    static targets = ['likeImage', 'Count']
    static values = { likeableId: String, likeableType: String, userId: String} 

    connect() {
    //   this.element.textContent = "Hello connected!"
    }
    
    onClicked(){
        var targetImg = this.likeImageTarget
        var likeCount = this.CountTarget
        const response =  fetch('/likes', {
            method: 'POST',
            headers: {
              'Content-Type': 'application/json',
              'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
            },
            body: JSON.stringify({
              user_id: this.userIdValue,
              likeable_id: this.likeableIdValue,
              likeable_type: this.likeableTypeValue
      
            })
          })
          .then(async response => {
            const result = await response.json();
            console.log('Response:', result);
            debugger
            if (result['like']) {
              // const divEle = document.querySelectorAll(`[data-like-likeable-id-value="${result['likeable_id']}"]`);
              // const image = divEle.querySelector('img.like-image');
              targetImg.setAttribute("src", "/assets/like-image.png");
              likeCount.innerHTML = `${result.count} likes`


                // document.getElementsByClassName("like-image")[0].setAttribute("src", "/assets/like-image.png");;
                // console.log('image with fillup heart')
            }
            else{
                // image = document.querySelectorAll(`[data-like-likeable-id-value="${result['likeable_id']}"]`);

                // image.setAttribute("src", "/assets/heart.svg");
                // const divEle = document.querySelectorAll(`[data-like-likeable-id-value="${result['likeable_id']}"]`);
                // const image = divEle.querySelector('img.like-image');
                targetImg.setAttribute("src", "/assets/heart.svg");
                likeCount.innerHTML = `${result.count} likes`

            }
            // handle succ  zess response
          })
          .catch(error => {
            console.error('There was a problem with your fetch operation:', error);
            // handle error response
          });
    }
  }