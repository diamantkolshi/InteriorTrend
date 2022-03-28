import React, { useState, useEffect } from 'react';
import { withScope } from "./i18n";
import {
    Button, FormGroup, Input, Label
} from 'reactstrap';

const tfilter = withScope('helpers', 'filters');

const Filters = ({children, title, clearFilters}) => {
  return (
    <div className="col-lg-3">
      <div className="card mb-4">
        <form>
          <div className="card">
            <div className="card-header">
              <div className="card-header-title">{title}</div>
            </div>
            <div className="card-body">
              {children}
              <hr />
              <FormGroup>
                <a className="btn btn-info btn-block btn-sm" onClick={clearFilters}>{tfilter('clear_filters')}</a>
              </FormGroup>
            </div>
          </div>
        </form>
      </div>
    </div>
  )
};

export default Filters;
