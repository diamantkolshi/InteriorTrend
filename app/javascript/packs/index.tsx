import "../src/app.scss";

import { InertiaApp } from "@inertiajs/inertia-react";
import React from "react";
import { render } from "react-dom";
import $ from 'jquery';
import Axios from "axios";
import * as moment from 'moment';
import { InertiaProgress } from "@inertiajs/progress";
import Layout from '../components/Layout'
import 'react-datepicker/dist/react-datepicker.css';

Axios.defaults.headers.common['X-CSRF-TOKEN'] = document.querySelector("meta[name='csrf-token']").getAttribute("content");

document.addEventListener("DOMContentLoaded", () => {
  InertiaProgress.init();
  const app = document.getElementById("app");

  render(
    <InertiaApp
      initialPage={JSON.parse(app.dataset.page)}
      resolveComponent={name => require(`../src/pages/${name}`).default}
      />,
    app
  );
});
