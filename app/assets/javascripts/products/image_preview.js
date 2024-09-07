document.addEventListener("DOMContentLoaded", function() {
  const fileInput = document.querySelector('input[type="file"]');
  if (fileInput===null) return
  fileInput.addEventListener('change', function(event) {
    const imagePreview = fileInput.nextElementSibling;
    const file = event.target.files[0];
    const reader = new FileReader();
    
    let img = document.createElement('img');

    reader.onload = function(e) {
      imagePreview.innerHTML = '';  // Clear the previous image.
      img.src = e.target.result;
      img.alt = 'Uploaded image';
      img.width = 300;
      img.height = 200;

      imagePreview.appendChild(img);
    };
    
    if (file) {
      reader.readAsDataURL(file);
    }
  });
});