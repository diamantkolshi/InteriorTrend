import React, { useState } from 'react';
import { Inertia } from "@inertiajs/inertia";
import {
  Col,
  CustomInput,
  Input,
  Row
} from 'reactstrap';

import useErrors from "../../../shared/useErrors";
import { withScope } from "../../../shared/i18n";
import ProjectLayout from "../Layout";
import { Modal, Button, Form, ModalBody, ModalFooter, ModalHeader, } from "reactstrap";
import PostInfoForm from "../forms/PostInfoForm";
import CardFormModal from "../../../shared/CardFormModal";
const ttable = withScope('helpers', 'project', 'index', 'table');

const New = ({project, posts, post}) => {
  const [postValues, setPostValues] = useState(post);

  function handleSubmit() {
    Inertia.post(`/projects/${project.id}/posts`, {
      post: postValues
    }, {preserveScroll: true, preserveState: true});
  }

  function handleChange(update) {
    setPostValues(update)
  }

  function toggleModal() { 
    Inertia.visit(`/projects/${project.id}/posts`, {preserveScroll: true})
  }

  return (
    <ProjectLayout project={project} posts={posts}> 
      <Modal isOpen={!!post} size="lg" toggle={() => toggleModal()} backdrop={'static'}>
        <CardFormModal onSubmit={handleSubmit} title={"Shto Postim te ri"}  errors={useErrors('ingredient')} toggleModal={toggleModal}>
          <PostInfoForm
            post={postValues}
            onChange={handleChange}
          />
        </CardFormModal>
      </Modal>
    </ProjectLayout>
  )
}

export default New;
