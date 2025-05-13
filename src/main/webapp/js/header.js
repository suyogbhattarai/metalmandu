/**
 * 
 * 
 * 
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
