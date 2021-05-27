import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";
import { French } from "flatpickr/dist/l10n/fr.js"

const initFlatpickr = () => {
  flatpickr("#range_start", {
    altInput: true,
    altFormat: "j F Y",
    plugins: [new rangePlugin({ input: "#range_end" })]
  });
}

export { initFlatpickr };