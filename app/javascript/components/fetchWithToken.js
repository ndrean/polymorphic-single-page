import { csrfToken } from "@rails/ujs";

const fetchWithToken = (url, options) => {
  console.log("fetch");
  options.headers = {
    "X-CSRF-Token": csrfToken(),
    ...options.headers,
  };
  options.credentials = "same-origin";

  return fetch(url, options);
};

export { fetchWithToken };

// https://kitt.lewagon.com/knowledge/tutorials/fetch_in_rails
