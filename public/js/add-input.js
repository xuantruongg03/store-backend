$("#add-input").on("click", (e) => {
    const div = document.createElement("div");
    div.className = "form-group mt-2 mb-5";
    div.innerHTML = `
        <input class="form-control" id="detailProduct" name="nameDetails" placeholder="name">
        <input class="form-control" id="detailProduct" name="valueDetails" placeholder="value">
    `;
    document.getElementById("list").appendChild(div);
    });
