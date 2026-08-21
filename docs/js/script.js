document.addEventListener("DOMContentLoaded", () => {
  document.querySelectorAll("[data-year]").forEach(el => {
    el.textContent = new Date().getFullYear();
  });

  // On touch devices, tapping an artist card opens its video reel.
  // Desktop hover behavior remains intact.
  document.querySelectorAll(".artist-card").forEach(card => {
    const trigger = card.querySelector(".artist-trigger");
    if (!trigger) return;

    trigger.addEventListener("click", (event) => {
      if (event.target.closest(".band-icons a")) return;
      if (window.matchMedia("(hover: none)").matches) {
        card.classList.toggle("is-open");
      }
    });
  });
});
