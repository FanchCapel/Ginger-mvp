const priceUpdate = (e) => {
  const activity_ids = [];
  document.querySelectorAll('.selected-activities').forEach((activity) => {
    if (activity.value !== "") {
      activity_ids.push(activity.value);
    }
  });
  fetch('/activities/calculate_experience', {
    method: "POST",
    headers: { 'X-CSRF-Token': document.querySelector("input[name='authenticity_token']").value, 'Content-type': "application/json" },
    body: JSON.stringify({ activity_ids: activity_ids })
  })
  .then(response => response.json())
  .then((data) => {
    document.querySelector('#prix').innerHTML = data["amount"]
    document.querySelector('#duration').innerText = `${Math.floor(data["duration"] / 60)} h ${data["duration"] % 60} min`
  });
}

let dragged;

/* events fired on the draggable target */
document.addEventListener("drag", (event) => {});

document.addEventListener("dragstart", (event) => {
  // store a ref. on the dragged elem
  dragged = event.target;
  // make it half transparent
  event.target.style.opacity = .5;
});

document.addEventListener("dragend", (event) => {
  // reset the transparency
  event.target.style.opacity = "";
});

/* events fired on the drop targets */
document.addEventListener("dragover", (event) => {
  // prevent default to allow drop
  event.preventDefault();
});

document.addEventListener("dragenter", (event) => {
  // highlight potential drop target when the draggable element enters it
  if ( event.target.className.includes("dropzone")) {
    event.target.style.background = "#FEA126";
  }
});

document.addEventListener("dragleave", (event) => {
  // reset background of potential drop target when the draggable element leaves it
  if ( event.target.className.includes("dropzone")) {
    event.target.style.background = "";
  }
});

document.addEventListener("drop", (event) => {
  event.preventDefault();
  // copy dragged elem to the selected drop target
  if (event.target.className.includes("dropzone")) {
    event.target.style.background = "";
    event.target.appendChild(dragged.cloneNode(true));
    event.target.nextElementSibling.value = dragged.getAttribute('value');
    event.target.style.opacity = 1;
    dragged.style.background = "green";
    event.target.insertAdjacentHTML("afterbegin", `<a class='boxclose' id=boxclose${dragged.getAttribute('value')}></a>`)
    removeElement(event.target, dragged);
    priceUpdate(event);
  }
});

removeElement = (dropTarget, draggedElement) => {
  boxclose = document.querySelector(`#boxclose${draggedElement.getAttribute('value')}`);
    boxclose.addEventListener('click', (event) => {
      event.target.nextElementSibling.remove();
      draggedElement.style.background = "";
      dropTarget.nextElementSibling.value = "";
      event.target.remove();
      priceUpdate(event);
    });
}


