import "bootstrap";
import "../components/sortable";
import "../components/slider";
import "../components/tabs";
import "../components/draggable";
import "../plugins/flatpickr"

export const selectedExperienceType = () => {
	const bothSelected = document.getElementById('experience_experience_type_3');
	bothSelected.addEventListener('click', (event) => {
		bothSelected.disabled = true;
		document.getElementById('experience_experience_type_2').checked = true;
	})
}

selectedExperienceType();