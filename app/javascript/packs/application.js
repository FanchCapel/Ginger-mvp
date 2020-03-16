import "bootstrap";
import "../components/sortable";
import "../components/slider";
import "../components/tabs";
import "../components/draggable";
import "../plugins/flatpickr"

export const selectedExperienceType = () => {
  const restOptionsArray = [["", null],["150 CHF", 150]];
  const budgetList = document.getElementById('experience_budget_cents');

	const bothSelected = document.getElementById('experience_experience_type_3');
	bothSelected.addEventListener('click', (event) => {
		bothSelected.disabled = true;
		document.getElementById('experience_experience_type_2').checked = true;
		document.getElementById('experience_both_experiences_selected').value = true;
    document.getElementById('new-butler-container-home').classList.add('d-flex');

    budgetList.innerHTML = "";
    restOptionsArray.forEach((option) => {
      const el = document.createElement("option");
      el.textContent = option[0];
      el.value = option[1];
      budgetList.appendChild(el);
    })
	})
}

export const setBudgetOptions = () => {
  const expOptionsArray = [["", null],["150 CHF", 150], ["275 CHF", 275]];
  const restOptionsArray = [["", null],["150 CHF", 150]];
  const budgetList = document.getElementById('experience_budget_cents');

  const experienceSelected = document.getElementById('experience_experience_type_1')
  experienceSelected.addEventListener('click', (event) => {
    budgetList.innerHTML = "";
    expOptionsArray.forEach((option) => {
      const el = document.createElement("option");
      el.textContent = option[0];
      el.value = option[1];
      budgetList.appendChild(el);
    })
  })

  const restaurantSelected = document.getElementById('experience_experience_type_2')
  restaurantSelected.addEventListener('click', (event) => {
    budgetList.innerHTML = "";
    restOptionsArray.forEach((option) => {
      const el = document.createElement("option");
      el.textContent = option[0];
      el.value = option[1];
      budgetList.appendChild(el);
    })
  })
}

selectedExperienceType();
setBudgetOptions();
