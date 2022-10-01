import React, { useState } from 'react';
import { Inertia } from "@inertiajs/inertia";
import { useForm } from '@inertiajs/inertia-react'
import { Modal } from "reactstrap";
import useErrors from "../../../shared/useErrors";
import { withScope } from "../../../shared/i18n";
import ProjectLayout from "../Layout";
import PostInfoForm from "../forms/PostInfoForm";
import CardFormModal from "../../../shared/CardFormModal";

const ttable = withScope('helpers', 'project', 'index', 'table');


const New = ({project, posts, post}) => {
  const [postValues, setPostValues] = useState(post);

  const { data, setData } = useForm({
    title: post.title,
    description: post.description,
    avatar: null
  })

  function handleSubmit() {
    Inertia.post(`/projects/${project.id}/posts`, {
      post: data
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
        <CardFormModal onSubmit={handleSubmit} title="Shto Postim te ri"  errors={useErrors('ingredient')} toggleModal={toggleModal}>
          <PostInfoForm
            post={postValues}
            onChange={handleChange}
            data={data}
            setData={setData}
          />
        </CardFormModal>
      </Modal>
    </ProjectLayout>
  )
}

export default New;
