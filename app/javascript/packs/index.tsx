import "../src/app.scss";

import { InertiaApp } from "@inertiajs/inertia-react";
import React from "react";
import { render } from "react-dom";
import $ from 'jquery';
import Axios from "axios";
import dayjs from 'dayjs';
import 'dayjs/locale/sq';
import localizedFormat from "dayjs/plugin/localizedFormat";
import sq from 'date-fns/locale/sq';
import { registerLocale, setDefaultLocale } from "react-datepicker";
import * as moment from 'moment';
import { InertiaProgress } from "@inertiajs/progress";
import Layout from '../components/Layout'
import 'react-datepicker/dist/react-datepicker.css';

registerLocale('sq', sq);
setDefaultLocale('sq');

dayjs.locale('sq'); // use locale globally
dayjs.extend(localizedFormat);

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
