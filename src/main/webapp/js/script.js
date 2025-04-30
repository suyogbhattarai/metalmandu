const hamClick=document.querySelector(".hamburger");
const sideMenu = document.querySelector(".side-menu");
const close=document.querySelector(".cross")
const search = document.querySelector(".search-slide-down")
const searchButton=document.querySelector(".search-bar")
const searchBar = document.querySelector(".search-bar")
const dropDown = document.querySelector(".fa-caret-down");
const sub_menu = document.querySelector('.sub-menu') 
const scroll_down = document.querySelector('.scroll-down')



window.addEventListener("scroll", function () {

  let topButton = document.querySelector(".to-top-btn");
  let scrollY = window.scrollY || window.pageXOffset;

  if (scrollY > 200) {
    topButton.style.visibility = "visible";
    topButton.style.opacity = "1";
  } else {
    topButton.style.visibility = "hidden";
    topButton.style.opacity = "0";
  }
});

// ad js ends




let topButton = document.querySelector(".to-top-btn");

topButton.addEventListener("click", function () {
  window.scrollTo({
    top: 0,
    behavior: "smooth",
  });
});




window.addEventListener("scroll", function () {
   let headerBar = document.querySelector("header");
   let slidedown = document.querySelector(".slide-down-navbar");
 
   let scrollY = window.scrollY || window.pageYOffset;
   if (scrollY > 200) {
     headerBar.classList.add("slide-down-navbar");
     headerBar.classList.remove("header-default");
   } else {
     headerBar.classList.remove("slide-down-navbar");
     headerBar.classList.add("header-default");
   }
 });

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
        search.style.bottom = "10.2%";
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

// product slider 

let span1 = document.querySelector('.left');
let span2 = document.querySelector('.right');
	let product = document.getElementsByClassName('product-box')
	let product_page = Math.ceil(product.length/4);
	let l = 0;
	let movePer = 25.34;
	let maxMove = 203;
	// mobile_view	
	let mob_view = window.matchMedia("(max-width: 768px)");
	if (mob_view.matches)
	 {
	 	movePer = 50.36;
	 	maxMove = 504;
	 }

	let right_mover = ()=>{
		l = l + movePer;
		if (product == 1){l = 0; }
		for(const i of product)
		{
			if (l > maxMove){l = l - movePer;}
			i.style.left = '-' + l + '%';
		}

	}
	let left_mover = ()=>{
		l = l - movePer;
		if (l<=0){l = 0;}
		for(const i of product){
			if (product_page>1){
				i.style.left = '-' + l + '%';
			}
		}
	}
	span2.onclick = ()=>{right_mover();console.log("rightclicked")}
	span1.onclick = ()=>{left_mover();}

   // login script

   const sign_in_btn = document.querySelector("#sign-in-btn");
const sign_up_btn = document.querySelector("#sign-up-btn");
const containerr = document.querySelector(".login-container");

sign_up_btn.addEventListener("click", () => {
  containerr.classList.add("sign-up-mode");
});

sign_in_btn.addEventListener("click", () => {
  containerr.classList.remove("sign-up-mode");
});



function menuToggle() {
   const toggleMenu = document.querySelector(".menu");
   toggleMenu.classList.toggle("active");
 }
