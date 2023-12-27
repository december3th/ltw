const deleteButton = document.getElementById('delete_hidden');
const targetElement = document.getElementById('hidden_update');

deleteButton.addEventListener('click', function() {
  targetElement.classList.remove('hidden');
});