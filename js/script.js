function activateSection(id) {
    const sections = document.querySelectorAll('.section');
    sections.forEach(s => s.classList.remove('active'));
    document.getElementById(id).classList.add('active');

    document.body.className = id;

    // Show nav, hide landing
    document.getElementById('initial-buttons').style.display = 'none';
    document.getElementById('site-header').style.display = 'none';
    document.getElementById('main-nav').style.display = 'block';

    window.scrollTo({ top: 0, behavior: 'smooth' });
  }

  function goHome() {
    // Hide all sections
    const sections = document.querySelectorAll('.section');
    sections.forEach(s => s.classList.remove('active'));

    // Reset theme
    document.body.className = '';

    // Show landing again
    document.getElementById('initial-buttons').style.display = 'block';
    document.getElementById('site-header').style.display = 'block';
    document.getElementById('main-nav').style.display = 'none';

    window.scrollTo({ top: 0, behavior: 'smooth' });
  }