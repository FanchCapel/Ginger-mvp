export const sliderValue = () => {
  const slider = document.getElementById("exp-preferences");
  const sliderForm = document.querySelector(".slider-form");
  if (slider !== null) {
    slider.addEventListener('change', event => {
      Rails.fire(sliderForm, 'submit');
    });
  }
}

export const showCategories = (formHTML) => {
  const form = document.getElementById('preferences-form');
  form.insertAdjacentHTML('beforeend', formHTML);
}

sliderValue();
