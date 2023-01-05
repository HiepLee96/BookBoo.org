//Open the search bar when user click on the search button
searchForm = document.querySelector('.search-form');
document.querySelector('#search-btn').onclick = () =>{
  searchForm.classList.toggle('active');
}


window.onscroll = () => {
    //Close the search bar when user scroll screen
    searchForm.classList.remove('active');
    
    if(window.scrollY > 80){
        document.querySelector('.header .header-2').classList.add('active');
    } else {
        document.querySelector('.header .header-2').classList.remove('active');
    }
}

window.onload = () => {
    if(window.scrollY > 80){
        document.querySelector('.header .header-2').classList.add('active');
    } else {
        document.querySelector('.header .header-2').classList.remove('active');
    }

    //Goi ham xuat bieu tuong loading sau moi lan tai lai trang web
    fadeOut();
}

//Loader function
/**
function loader(){
    document.querySelector('.loader-container').classList.add('active');
}
function fadeOut(){
    setTimeout(loader, 1500);
}
 */




//Swiper Aniamate HOME SECTION
var swiper = new Swiper(".books-slider", {
    loop: true,
    centeredSlides: true,
    autoplay: {
        delay: 9500,
        disableOnInteraction: false,
    },
    breakpoints: {
      0: {
        slidesPerView: 2,
      },
      768: {
        slidesPerView: 2,
      },
      1024: {
        slidesPerView: 3,
      },
    },
  });

 
//Swiper Aniamate FEATURED SECTION
var swiper = new Swiper(".featured-slider", {
    spaceBettween: 10,
    loop: true,
    centeredSlides: true,
    autoplay: {
        delay: 9500,
        disableOnInteraction: false,
    },
    navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
      },
    breakpoints: {
      0: {
        slidesPerView: 1,
      },
      450: {
        slidesPerView: 2,
      },
      768: {
        slidesPerView: 3,
      },
      1024: {
        slidesPerView: 4,
      },
    },
  });

//Swiper Aniamate ARRIVALS SECTION
var swiper = new Swiper(".arrivals-slider", {
    spaceBettween: 10,
    loop: true,
    centeredSlides: true,
    autoplay: {
        delay: 9500,
        disableOnInteraction: false,
    },
    breakpoints: {
      0: {
        slidesPerView: 1,
      },
      768: {
        slidesPerView: 2,
      },
      1024: {
        slidesPerView: 3,
      },
    },
  });

//Swiper Aniamate REVIEWS SECTION
var swiper = new Swiper(".reviews-slider", {
    spaceBettween: 10,
    grabCursor: true,
    loop: true,
    centeredSlides: true,
    autoplay: {
        delay: 9500,
        disableOnInteraction: false,
    },
    breakpoints: {
      0: {
        slidesPerView: 1,
      },
      768: {
        slidesPerView: 2,
      },
      1024: {
        slidesPerView: 3,
      },
    },
  });

//Swiper Aniamate REVIEWS SECTION
var swiper = new Swiper(".blog-slider", {
    spaceBettween: 10,
    grabCursor: true,
    loop: true,
    centeredSlides: true,
    autoplay: {
        delay: 9500,
        disableOnInteraction: false,
    },
    breakpoints: {
      0: {
        slidesPerView: 1,
      },
      768: {
        slidesPerView: 2,
      },
      1024: {
        slidesPerView: 3,
      },
    },
  });


//Kiem duyet form search khong duoc de trong
function isLoginFormEmpty() {
  var username = document.getElementById('username').value;
  var password = document.getElementById('password').value;
  var flag = true;

  if(username.length == 0){
    document.getElementById('errUserName').innerHTML="Please enter your username!";
    flag = false;
  }
  if(password.length == 0){
    document.getElementById('errPassword').innerHTML="Please enter your password!";
    flag = false;
  }

  return flag;
}

function isSearchFormEmpty() {
	var searchInput = document.getElementById('search-box').value();
	
	if(searchInput.length == 0){
		return false;
	}
	
	return true;
}
