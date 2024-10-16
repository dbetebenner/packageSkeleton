document.addEventListener('DOMContentLoaded', function() {
  // Find the navbar-brand element which contains both the logo and the title
  const navbarBrand = document.querySelector('.navbar-brand');

  // Create a new <a> element for the package title
  const titleElement = navbarBrand.querySelector('.navbar-title');
  const packageLink = document.createElement('a');
  packageLink.href = 'https://centerforassessment.github.io/packageSkeleton/';
  packageLink.classList.add('navbar-brand-title');
  packageLink.textContent = titleElement.textContent;

  // Insert the new <a> element after the logo and remove the original title
  navbarBrand.appendChild(packageLink);
  titleElement.remove();
});
