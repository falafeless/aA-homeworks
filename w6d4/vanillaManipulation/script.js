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

  const handleFavoriteSubmit = (e) => {
    e.preventDefault();

    const favoriteInput = document.querySelector(".favorite-input");
    const favoriteValue = favoriteInput.value;
    favoriteInput.val = "";

    const newLi = document.createElement("li");
    newLi.textContent = favoriteValue;

    const favoritesList = document.getElementById("sf-places");
    favoritesList.appendChild(newLi);
  };

  const listSubmitButton = document.querySelector(".favorite-submit");
  listSubmitButton.addEventListener("click", handleFavoriteSubmit);


  // adding new photos

  // --- your code here!

  const handleFormShow = (e) => {
    const photoFormContainer = document.querySelector(".photo-form-container");
    if (photoFormContainer.className === "photo-form-container hidden") {
      photoFormContainer.className = "photo-form-container";
    } else {
      photoFormContainer.className = "photo-form-container hidden";
    }
  };

  const photoFormShowButton = document.querySelector(".photo-show-button");
  photoFormShowButton.addEventListener("click", handleFormShow);



  const handlePhotoSubmit = (e) => {
    e.preventDefault();

    const photoUrlInput = document.querySelector(".photo-url-input");
    const photoUrl = photoUrlInput.value;
    photoUrlInput.value = "";

    const newImg = document.createElement("img");
    newImg.src = photoUrl;

    const newPhotoLi = document.createElement("li");
    newPhotoLi.appendChild(newImg);

    const dogPhotosList = document.querySelector(".dog-photos");
    dogPhotosList.appendChild(newPhotoLi);
  };

  const photoSubmitButton = document.querySelector(".photo-url-submit");
  photoSubmitButton.addEventListener("click", handlePhotoSubmit);

});
