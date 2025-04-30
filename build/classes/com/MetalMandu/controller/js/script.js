/**
 * 
 */
const hamClick=document.querySelector(".hamburger");
const sideMenu = document.querySelector(".side-menu");
const close=document.querySelector(".cross")
const search = document.querySelector(".search-slide-down")
const searchButton=document.querySelector(".search-bar")
const searchBar = document.querySelector(".search-bar")
const dropDown = document.querySelector(".fa-caret-down");
const sub_menu = document.querySelector('.sub-menu') 
const scroll_down = document.querySelector('.scroll-down')

hamClick.addEventListener("click", (e) =>{
 
   sideMenu.style.right ="0%"
   sideMenu.style.opacity="1"
   sideMenu.style.transition ="0.5s all ease"
})

close.addEventListener("click", (e) =>{
   sideMenu.style.right="-70%"
   sideMenu.style.opacity="0"
  
})


let isSearchOpen = false; // Flag to track the toggle state

searchButton.addEventListener("click", (e) => {
    if (!isSearchOpen ) {
        // If the search is closed, open it
        search.style.top = "3.2%";
        search.style.opacity = "1";
        searchBar.style.border = '2.5px solid black'
    } else {
        // If the search is open, close it
        search.style.bottom = "0%";
        search.style.opacity = "0";
        searchBar.style.border = '2.5px solid transparent'
    }
    search.style.transition = "0.5s all ease";
    isSearchOpen = !isSearchOpen; // Toggle the flag


});



//slider js

// Access the Images
let slideImages = document.querySelectorAll('#img-slide');
// Access the next and prev buttons
let next = document.querySelector('.next');
let prev = document.querySelector('.prev');
// Access the indicators
let dots = document.querySelectorAll('.dot');

var counter = 0;

// Code for next button
next.addEventListener('click', slideNext);
function slideNext(){
slideImages[counter].style.animation = 'next1 0.5s ease-in forwards';
if(counter >= slideImages.length-1){
   counter = 0;
}
else{
   counter++;
}
slideImages[counter].style.animation = 'next2 0.5s ease-in forwards';
indicators();
}

// Code for prev button
prev.addEventListener('click', slidePrev);
function slidePrev(){
slideImages[counter].style.animation = 'prev1 0.5s ease-in forwards';
if(counter == 0){
   counter = slideImages.length-1;
}
else{
   counter--;
}
slideImages[counter].style.animation = 'prev2 0.5s ease-in forwards';
indicators();
}

// Auto slideing
function autoSliding(){
   deletInterval = setInterval(timer, 3000);
   function timer(){
      slideNext();
      indicators();
   }
}
autoSliding();

// Stop auto sliding when mouse is over
const container = document.querySelector('.slide-container');
container.addEventListener('mouseover', function(){
   clearInterval(deletInterval);
});

// Resume sliding when mouse is out
container.addEventListener('mouseout', autoSliding);

// Add and remove active class from the indicators
function indicators(){
   for(i = 0; i < dots.length; i++){
      dots[i].className = dots[i].className.replace(' active', '');
   }
   dots[counter].className += ' active';
}

// Add click event to the indicator
function switchImage(currentImage){
   currentImage.classList.add('active');
   var imageId = currentImage.getAttribute('attr');
   if(imageId > counter){
   slideImages[counter].style.animation = 'next1 0.5s ease-in forwards';
   counter = imageId;
   slideImages[counter].style.animation = 'next2 0.5s ease-in forwards';
   }
   else if(imageId == counter){
      return;
   }
   else{
   slideImages[counter].style.animation = 'prev1 0.5s ease-in forwards';
   counter = imageId;
   slideImages[counter].style.animation = 'prev2 0.5s ease-in forwards';	
   }
   indicators();
}