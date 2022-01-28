const initClickMe = () => {
  var initClickMe;
  document.querySelector("#click-participate").addEventListener('click', function(){
    initClickMe = document.querySelector("#event-subinformations p");
    console.log(initClickMe);
  });
}
export {initClickMe};
