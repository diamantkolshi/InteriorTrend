import React, { ReactElement, useState, useEffect } from 'react';
import Gravatar from 'react-awesome-gravatar';
import {
    Dropdown,
    DropdownToggle,
    DropdownItem,
    DropdownMenu,
    NavLink,
    Breadcrumb,
    BreadcrumbItem, NavbarBrand
} from 'reactstrap';
import { InertiaLink, usePage } from "@inertiajs/inertia-react";
import { ToastContainer } from 'react-toastify';
import Axios from 'axios';
import 'react-toastify/dist/ReactToastify.css';
import { toast } from 'react-toastify';
import { withScope } from "../../shared/i18n";

const theader = withScope('header');

const Layout: React.FC<{
    title: string;
    actions?: ReactElement;
    breadcrumps?: {name: string; href: string}[];
}> = ({children, title, actions, breadcrumps = []}) => {
  const { message } = usePage()
  const logo = require('../../../images/logo.png');

  useEffect(() => {
    if(message) {
      toast.success(message)
    }
  }, message)

  const {user} = usePage();

  const [dropdownOpen, setDropdownOpen] = useState(false);
  const handleLogout = () => {
    Axios.delete('/users/sign_out', {maxRedirects: 0}).finally(() => {
      window.location.href = '/users/sign_in';
    });
  };
  const toggle = () => setDropdownOpen(prevState => !prevState);

  return (
    <div id="wrapper">
      <div id="content-wrapper">
        <div id="content">
          <ToastContainer
            position="top-center"
          />
        <nav className="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
          <NavbarBrand>
            <img src={logo} width="128" alt="logo" />
          </NavbarBrand>

          <form className="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
            <div className="input-group">
              <input type="text" className="form-control bg-light border-0 small"
                     placeholder={theader('search_for')} aria-label="Search" aria-describedby="basic-addon2"
                                                                      />
              <div className="input-group-append">
                <button className="btn btn-primary" type="button">
                  <i className="fas fa-search fa-sm" />
                </button>
              </div>
            </div>
          </form>
          <ul className="navbar-nav ml-auto">
            <li className="nav-item dropdown no-arrow d-sm-none">
                <a className="nav-link dropdown-toggle" href="#search" id="searchDropdown" role="button"
                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i className="fas fa-search fa-fw" />
                </a>
                <div className="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                     aria-labelledby="searchDropdown">
                  <form className="form-inline mr-auto w-100 navbar-search">
                    <div className="input-group">
                        <input type="text" className="form-control bg-light border-0 small"
                               placeholder={theader('search_for')} aria-label="Search"
                               aria-describedby="basic-addon2"
                               />
                        <div className="input-group-append">
                          <button className="btn btn-primary" type="button">
                            <i className="fas fa-search fa-sm" />
                          </button>
                        </div>
                    </div>
                  </form>
                </div>
              </li>

              <li className="nav-item mx-1">
                <NavLink tag={InertiaLink} className="nav-link" href="/projects"
                   data-toggle="dropdown">
                    {theader('projects')}
                    <span className="badge badge-danger badge-counter">3+</span>
                </NavLink>
              </li>
              <div className="topbar-divider d-none d-sm-block" />
              <Dropdown isOpen={dropdownOpen} toggle={toggle} className="nav-item no-arrow">
                <DropdownToggle nav>
                  <span className="mr-2 d-none d-lg-inline text-gray-600 small">{user.email}</span>
                  <Gravatar email={user.email}>
                      {url => (<img className="img-profile rounded-circle" alt={user.email} src={url} />)}
                  </Gravatar>
                </DropdownToggle>
                <DropdownMenu>
                  <DropdownItem>
                    <i className="fas fa-user fa-sm fa-fw mr-2 text-gray-400" />
                    {theader('profile')}
                  </DropdownItem>
                  <DropdownItem>
                    <i className="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400" />
                    {theader('settings')}
                  </DropdownItem>
                  <DropdownItem onClick={handleLogout}>
                    <i className="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400" />
                    {theader('sign_out')}
                  </DropdownItem>
                </DropdownMenu>
              </Dropdown>
          </ul>
        </nav>
        <div className="container-fluid">
          <div className="d-sm-flex align-items-center justify-content-between mb-4">
            <Breadcrumb listClassName="h3 mb-0 text-gray-800 px-0 bg-transparent">
                {breadcrumps.map(({name, href}) => <BreadcrumbItem href={href} tag={InertiaLink} key={href}>{name}</BreadcrumbItem>)}
                <BreadcrumbItem>{title}</BreadcrumbItem>
            </Breadcrumb>
            {/* <h1 className="h3 mb-0 text-gray-800">{title}</h1> */}
            <div>
              {actions}
            </div>
          </div>
          {children}
        </div>
      </div>
    </div>
  </div>
  )
};

export default Layout;
