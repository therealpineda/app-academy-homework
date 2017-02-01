document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });

  // adding SF places as list items

  const restButton = document.getElementsByClassName("favorite-submit");
  restButton[0].addEventListener("click", event => {
    event.preventDefault();
    const sfLocNameInput = document.getElementsByClassName("favorite-input");
    const locName = sfLocNameInput[0].value;
    sfLocNameInput.value = "";
    const ul = document.getElementById("restaurants");
    const li = document.createElement("li");
    li.textContent = locName;
    ul.appendChild(li);
  });

  // adding new photos

  const imgFormButton = document.getElementsByClassName("photo-show-button");
  imgFormButton[0].addEventListener("click", event => {
    event.preventDefault();
    const photoForm = document.getElementsByClassName("photo-form-container")[0];
    if (photoForm.className === "photo-form-container hidden") {
      photoForm.className = "photo-form-container";
    } else {
      photoForm.className = "photo-form-container hidden";
    }
  });

  const imgButton = document.getElementsByClassName("photo-url-submit");
  imgButton[0].addEventListener("click", event => {
    event.preventDefault();
    const imgInputField = document.getElementsByClassName("photo-url-input");
    const photoUrl = imgInputField[0].value;
    imgInputField[0].value = "";
    const ul = document.getElementsByClassName("dog-photos")[0];
    const img = document.createElement("img");
    img.src = photoUrl;
    const li = document.createElement("li");
    li.appendChild(img);
    ul.appendChild(li);
  });
});
