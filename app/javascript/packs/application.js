require("@rails/ujs").start();
require("@rails/activestorage").start();
require("channels");
//= require nested_form_fields
//= require jquery3
//= require jquery_ujs

import "bootstrap";

import { toggleDiv } from "../components/toggleDiv";

import { gestionGenres } from "../components/gestionGenres";

import { copyClipboard } from "../components/copyClipboard";

import { fetchWithToken } from "../components/fetchWithToken";

import { csrfToken } from "@rails/ujs";

import { fetchPostGenre } from "../components/fetchPostGenre";

import { fetchDeleteGenre } from "../components/fetchDeleteGenre.js";

require("../components/addFields");
require("../components/removeFields");

// import { addFields } from "../components/addFields";
