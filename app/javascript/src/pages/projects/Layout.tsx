import React, { useState } from 'react';
import { Badge, Button, Col, ListGroup, ListGroupItem, Row } from "reactstrap";
import { InertiaLink } from "@inertiajs/inertia-react";
import Layout from "../layouts/Layout";
import { t, withScope } from "../../shared/i18n";

const tlist = withScope('helpers', 'list_group');

const navItems = [
    {
        path: '/edit',
        label: tlist('general_information'),
    },
    {
        path: '/posts',
        label: tlist('posts'),
    }
];

const breadcrumps = [{name: 'Projektet', href: '/projects'}];
const ProjectLayout: React.FC<{ project: any; posts: any;}> = ({project, posts, children}) => {
    const isNew = !project.id;
    const currentPath = window.location.pathname;
    const [currentModal, setCurrentModal] = useState(null);
    const toggleModal = (modal) => {
        setCurrentModal(modal === currentModal ? null : modal);
    };
    return (
        <Layout
          title={`${project.title}`} breadcrumps={breadcrumps}
          actions={<div>
            <Button color="secondary" type="button" onClick={() => toggleModal('message')}>
              <i className="fas fa-plus fa-sm" />{' '}
              {t('helpers', 'post', 'new_post')}
            </Button>{' '}
          </div>}>
          <div>
            <Row className="justify-content-between">
              <Col lg={3} xl={2} className="mb-5">
                <ListGroup className="shadow">
                  {navItems.map(({path, label}) => (
                    <ListGroupItem key={path} tag={InertiaLink}
                       preserveState={isNew}
                       href={`/projects/${project.id || 'new'}${path}`}
                       active={((currentPath === `/projects/${project.id || 'new'}` && path === '') || (path !== '' && currentPath.indexOf(path) > -1))}>
                      {label}
                    </ListGroupItem>))
                  }

                  {posts.map((post) => (
                    <ListGroupItem key={`posts/${post.id}`}
                       tag={InertiaLink}
                       href={`/projects/${project.id}/posts/${post.id}`}
                       active={((currentPath === `/projects/${project.id}posts/${post.id}`))}
                       style={{paddingLeft: 35, fontSize: 14}}>
                      {post.title}
                    </ListGroupItem>))
                  }

                  <ListGroupItem
                     key={'posts/new'}
                     tag={InertiaLink}
                     href={`/projects/${project.id}/posts/new`}
                     active={((currentPath === `/projects/${project.id}/posts/new`))}
                     style={{paddingLeft: 35, fontSize: 14}}>
                     <i className="fas fa-plus fa-sm" /> Shto postim te ri
                  </ListGroupItem>
                </ListGroup>
              </Col>
              <Col lg={9} xl={10} className="mb-5">
                {children}
              </Col>
            </Row>
          </div>
        </Layout>
    )
};

export default ProjectLayout;
