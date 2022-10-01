import React, { useState, useEffect } from 'react';
import { Inertia } from "@inertiajs/inertia";
import {
  Button, FormGroup, Input, Label, NavLink
} from 'reactstrap';
import { InertiaLink } from "@inertiajs/inertia-react";
import * as moment from 'moment'
import DatePicker from "react-datepicker";
import { withScope } from "../../shared/i18n";
import "react-datepicker/dist/react-datepicker.css";
import Filters from "../../shared/Filters";
import ProjectLayout from "./Layout";


const ttable = withScope('helpers', 'post', 'index', 'table');
const trows = withScope('helpers', 'post', 'index', 'rows');
const tfilter = withScope('helpers', 'filters');

const Posts = ({project, posts, params, firstCreatedAt}) => {
  const [startDate, setStartDate] = useState(new Date(firstCreatedAt));
  const [pathParams, setPathParams] = useState(params);

  const closeNewProjectModal = () => {
    Inertia.visit(`posts`, {preserveScroll: true})
  }

  const truncate = (str, n) => {
		return str?.length > n ? `${str.substr(0, n - 1)  }...` : str;
	};

  const handleToDelete = (row) => {
    const r = window.confirm("Are you sure?");
    if (r === true) {
        Inertia.delete(`posts/${row.id}`, {preserveScroll: true});
    }
  }

  const editPost = (post) => {
    Inertia.visit(`posts/${post.id}/edit`, {preserveScroll: true})
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
    Inertia.visit(`posts?${queryParams}`, {preserveState: true})
  }

  return (
    <ProjectLayout project={project} posts={posts}>
      <div className="row">
        <div className="col-md-12 col-xl-9">
          <div className="card">
            <div className="card-header">
              <h6 className="card-header-title">{ttable('posts')}</h6>
            </div>
            <div className="card-body">
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
                        {trows('image')}
                      </th>
                      <th>
                        {trows('created_at')}
                      </th>
                      <th>
                        #
                      </th>
                    </tr>
                  </thead>
                  <tbody>
                    {posts
                      ?
                      posts.map((post, i) => (
                        <tr key={i}>
                          <td>
                            <NavLink tag={InertiaLink} className="nav-link" href={`/projects/${project.id}/posts/${post.id}/edit`} >
                              {post.title}
                            </NavLink>
                          </td>
                          <td>
                            {truncate(post.description, 40)}
                          </td>
                          <td>
                            #
                          </td>
                          <td>
                            {moment(post.created_at).format('DD/MM/YYYY')}
                          </td>
                          <td className="text-left">
                            <Button color="info" onClick={() => editPost(post)} className="mr-2 btn-sm">
                                <i className="fas fa-edit fa-sm" />
                            </Button>
                            <Button color="danger" onClick={() => handleToDelete(post)} className="btn-sm">
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
        <Filters clearFilters={() => closeNewProjectModal()}>
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
        </Filters>
      </div>
    </ProjectLayout>
  )
}

export default Posts;
