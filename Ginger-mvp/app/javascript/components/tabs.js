export const hideElements = () => {
  const tabcontent = document.getElementsByClassName("tabcontent");
  for (let i = 0; i < tabcontent.length; i++) {
    if (tabcontent[i].parentElement.className.includes("dropzone")) {
      tabcontent[i].style.display = "flex";
    } else {
      tabcontent[i].style.display = "none";
    }
  }
}

export const displayFilteredElements = (active_category, active_city) => {
  const elements = document.querySelectorAll(`.${active_category.id}.${active_city.id}`)
  elements.forEach((element) => {
    element.style.display = "flex";
  })
}

export const filterOnClick = (evt) => {

  // Get all elements with class="tabcontent" and hide them
  hideElements();

  // Get all tablinks for city and category
  const category_tablinks = document.querySelectorAll('.category.tablinks');
  const city_tablinks = document.querySelectorAll('.city.tablinks');

  // Get all elements with class="tablinks" and remove the class "active"
  if (evt.target.className.includes("city")) {
    for (let i = 0; i < city_tablinks.length; i++) {
      city_tablinks[i].className = city_tablinks[i].className.replace(" active", "");
    }
  } else {
    for (let i = 0; i < category_tablinks.length; i++) {
      category_tablinks[i].className = category_tablinks[i].className.replace(" active", "");
    }
  }
  evt.currentTarget.className += " active";
  const active_category = document.querySelector('.category.tablinks.active')
  const active_city = document.querySelector('.city.tablinks.active')

  // Display the elements corresponding to the active tabs
  displayFilteredElements(active_category, active_city);
}

export const clickEvents = () => {
  const tablinks = document.querySelectorAll('.tablinks')
  if (tablinks.length !== 0) {
    tablinks.forEach((tablink) => {
    tablink.addEventListener('click', e => filterOnClick(e));
  });
  }
}

export const filterAfterLoad = () => {
  const tabs = document.querySelectorAll('.tablinks.active')
  if (tabs.length !== 0) {
    hideElements();
    displayFilteredElements(tabs[0], tabs[1]);
  }
}

clickEvents();
filterAfterLoad();
