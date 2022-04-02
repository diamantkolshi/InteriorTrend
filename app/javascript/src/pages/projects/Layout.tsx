import React, { useState } from 'react';
import { Badge, Button, Col, ListGroup, ListGroupItem, Row } from "reactstrap";
import { InertiaLink } from "@inertiajs/inertia-react";
import Layout from "../layouts/Layout";
import { t } from "../../shared/i18n";

const navItems = [
    {
        path: '/edit',
        label: 'Informatat gjenerale',
    },
    {
        path: '/posts',
        label: 'Postimet',
    }
];

const breadcrumps = [{name: 'Project', href: '/projects'}];
const ProjectLayout: React.FC<{ project: any; }> = ({project, children}) => {
    const isNew = !project.id;
    const currentPath = window.location.pathname;
    const [currentModal, setCurrentModal] = useState(null);
    const toggleModal = (modal) => {
        setCurrentModal(modal === currentModal ? null : modal);
    };
    return (
        <Layout
          title={isNew ? 'Neu' : `${project.title}`} breadcrumps={breadcrumps}
          actions={!isNew && <div>
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
                  </ListGroupItem>))}
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
