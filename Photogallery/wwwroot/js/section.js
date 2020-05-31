function ScrollToSection(id) {
    var element = document.getElementById(id);

    if (element) {
        element.scrollIntoView({
            behavior: 'smooth'
        });
    }
}