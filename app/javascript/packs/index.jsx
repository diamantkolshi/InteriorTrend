import "../src/app.scss";

import { InertiaApp } from "@inertiajs/inertia-react";
import React from "react";
import { render } from "react-dom";
import $ from 'jquery';
import 'popper.js'
import 'bootstrap';
import Axios from "axios";
import * as moment from 'moment';
import { InertiaProgress } from "@inertiajs/progress";
import Layout from '../components/Layout'

Axios.defaults.xsrfHeaderName = "X-CSRF-TOKEN";

document.addEventListener("DOMContentLoaded", () => {
  InertiaProgress.init();
  const app = document.getElementById("app");

  render(
    <InertiaApp
      initialPage={JSON.parse(app.dataset.page)}
      resolveComponent={(name) => import(`../pages/${name}`).then(({default: page}) => {
        if (page.layout === undefined) {
          page.layout = Layout;
        }

        return page;
      })}
    />,
    app
  );
});
