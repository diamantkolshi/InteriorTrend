import React, { useState, useEffect } from 'react';
import { Inertia } from "@inertiajs/inertia";
import { withScope } from "../../shared/i18n";
import New from "./New"
import {
    Button, FormGroup, Input, Label
} from 'reactstrap';
import ProjectLayout from "../layouts/Layout";
import * as moment from 'moment'
import DatePicker from "react-datepicker";
import "react-datepicker/dist/react-datepicker.css";

const ttable = withScope('helpers', 'project', 'index', 'table');
const trows = withScope('helpers', 'project', 'index', 'rows');
const tfilter = withScope('helpers', 'filters');

const StyleExampleOne = ({projects, project, cities, params, firstCreatedAt}) => {
  const [startDate, setStartDate] = useState(new Date(firstCreatedAt));
  const [pathParams, setPathParams] = useState(params);

  const closeNewProjectModal = () => {
    Inertia.visit(`/projects`, {preserveScroll: true})
  }

  const truncate = (str, n) => {
		return str?.length > n ? `${str.substr(0, n - 1)  }...` : str;
	};

  const handleToDelete = (row) => {
    const r = window.confirm("Are you sure?");
    if (r === true) {
        Inertia.delete(`/projects/${row.id}`, {}, {preserveScroll: true});
    }
  }

  const addNew = () => {
    const queryParams = createQueryParams(pathParams)
    Inertia.visit(`/projects/new?${queryParams}`, {preserveScroll: true})
  }

  const editProject = (project) => {
    Inertia.visit(`/project/${project.id}/edit`, {preserveScroll: true})
  }

  const createQueryParams = params =>
      Object.keys(params)
            .map(k => `${k}=${encodeURI(params[k])}`)
            .join('&');

  const filterSelectChange = (e, type) => {
    if(type == "select") {
      let name = e.target.name
      let value = e.target.value
      pathParams[name] = value
    } else if (type == "date") {
      let date = moment(e).format('DD/MM/YYYY')
      setStartDate(e)
      pathParams['date'] = date
    }

    const queryParams = createQueryParams(pathParams)
    Inertia.visit(`/projects?${queryParams}`, {preserveState: true})
  }

  return (
    <ProjectLayout>
      <div id="content-top-bar">
        <nav>
          <ol className="breadcrump breadcrumb-title">
            <li className="breadcrumb-item">{ttable('projects')}</li>
          </ol>
        </nav>
        <div className="nav-buttons" />
      </div>
      <div className="row">
        <div className="col-md-12 col-xl-9">
          <div className="card">
            <div className="card-header">
              <h6 className="card-header-title">{ttable('projects')}</h6>
            </div>
            <div className="card-body">

              <div className="d-flex justify-content-between">
                <div>
                  <span className="mr-1">
                    {
                      <Button color="primary" onClick={() => addNew()} className="mr-2">
                          <i className="fas fa-plus fa-sm" />{' '}
                          {ttable('new_project')}
                      </Button>
                    }
                  </span>
                </div>
                <div className="d-flex justify-content-end align-items-center mb-2" />
              </div>

              <div style={{overflowX: 'auto'}}>
                <table className="table">
                  <thead>
                    <tr>
                      <th style={{width: '20px'}}>
                        {trows('title')}
                      </th>
                      <th style={{width: '25px'}}>
                        {trows('description')}
                      </th>
                      <th>
                        {trows('city')}
                      </th>
                      <th>
                        {trows('location')}
                      </th>
                      <th>
                        {trows('created_at')}
                      </th>
                      <th>
                        {trows('views')}
                      </th>
                      <th>
                        #
                      </th>
                    </tr>
                  </thead>
                  <tbody>
                    {projects
                      ?
                      projects.map((project, i) => (
                        <tr key={i}>
                          <td>
                            {project.title}
                          </td>
                          <td>
                            {truncate(project.description, 40)}
                          </td>
                          <td>
                            {project.city.name}
                          </td>
                          <td>
                            {project.location}
                          </td>
                          <td>
                            {moment(project.created_at).format('DD/MM/YYYY')}
                          </td>
                          <td>
                            {project.views || 'N/A'}
                          </td>
                          <td className="text-left">
                            <Button color="info" onClick={() => editProject(project)} className="mr-2 btn-sm">
                                <i className="fas fa-edit fa-sm" />
                            </Button>
                            <Button color="danger" onClick={() => handleToDelete(project)} className="btn-sm">
                                <i className="fas fa-trash fa-sm" />
                            </Button>
                          </td>
                        </tr>
                      ))
                      :
                      <tr>
                      </tr>
                    }
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
        <div className="col-lg-3">
          <div className="card mb-4">
            <form>
              <div className="card">
                <div className="card-header">
                  <div className="card-header-title">{tfilter('filters')}</div>
                </div>
                <div className="card-body">
                  <FormGroup>
                    <Label for="query">{tfilter('search')}</Label>
                    <Input
                      type="text"
                      id="query"
                      name="search"
                      placeholder={tfilter('search_placeholder')}
                      value={pathParams.search}
                      onChange={(e) => filterSelectChange(e, "select")}
                    />
                  </FormGroup>
                  <FormGroup>
                    <label htmlFor="Datumsbereich">{tfilter('from_created_at')}</label>
                    <DatePicker
                      id="valid_from"
                      className="d-block"
                      selected={startDate}
                      onChange={(date) => filterSelectChange(date, "date")}
                      dateFormat="dd.MM.yyyy"
                      customInput={<Input type="text" autoComplete="off" />}
                    />
                  </FormGroup>
                  <FormGroup>
                    <label htmlFor="Art">{tfilter('city')}</label>
                    <select className=" custom-select" name="city" value={pathParams.city} id="type" onChange={(e) => filterSelectChange(e, "select")}>
                      <option value="">{tfilter('all')}</option>
                      {
                        cities.map((city, i) => (
                            <option key={city.id} value={city.id}>{city.name}</option>
                        ))
                      }
                    </select>
                  </FormGroup>
                  <hr />
                  <FormGroup>
                    <a className="btn btn-info btn-block btn-sm" onClick={() => closeNewProjectModal()}>{tfilter('clear_filters')}</a>
                  </FormGroup>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
      <New isOpen={!!project} toggleModal={closeNewProjectModal} project={project} cities={cities} />
    </ProjectLayout>
  )
}

export default StyleExampleOne;
