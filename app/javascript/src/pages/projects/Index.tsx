import React, { useState, useEffect } from 'react';
import { Inertia } from "@inertiajs/inertia";
import TableNav from '../../../components/shared/TableNav'
import FilterNav from '../../../components/shared/FilterNav'
import HeaderNav from '../../../components/shared/HeaderNav'
import { withScope } from "../../shared/i18n";
import New from "./New"
import {
    Button,
} from 'reactstrap';
import ProjectLayout from "../layouts/Layout";

const ttable = withScope('helpers', 'project', 'index', 'table');
const trows = withScope('helpers', 'project', 'index', 'rows');

const StyleExampleOne = ({projects, project, cities}) => {
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
    Inertia.visit(`/projects/new`, {preserveScroll: true})
  }

  const editProject = (project) => {
    Inertia.visit(`/project/${project.id}/edit`, {preserveScroll: true})
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
                    {projects.map((project, i) => (
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
                          {project.created_at}
                        </td>
                        <td>
                          {project.views}
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
                    ))}
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
        <FilterNav />
      </div>
      <New isOpen={!!project} toggleModal={closeNewProjectModal} project={project} cities={cities} />
    </ProjectLayout>
  )
}

export default StyleExampleOne;
