import React, { useEffect, useState } from 'react';
import {
    Col,
    CustomInput,
    Input,
    Row
} from 'reactstrap';
import { useFormState } from 'react-use-form-state';
import CFormGroup from "../../../shared/CFormGroup";
import ImageDisplay from "../../../shared/ImageDisplay";
import useErrors from "../../../shared/useErrors";
import { withScope } from "../../../shared/i18n";

const tp = withScope('activerecord', 'attributes', 'project');
const Textarea = 'textarea';

const PostForm = ({post, ingredients, onChange, openModal, openEditModal, newMode = false}) => {
  function handleChange(e) {
    const {name, value} = e.currentTarget;

    onChange({...post, [name]: value})
  }

  const errors = useErrors('project');

  return (
    <div>
      <Row>
        <Col md={2}>
            <legend>Postimi</legend>
        </Col>
        <Col md={9} xl={8}>
          <Row form>
            <Col>
              <CFormGroup tag={Input}
                          label={tp('title')}
                          error={errors.title}
                          placeholder=""
                          value={post.title}
                          {...{type: "input", id: 'title'}}
                          onChange={handleChange}
                          />
            </Col>
          </Row>
          <Row form>
            <Col>
              <CFormGroup tag={Textarea}
                          label={tp('description')}
                          error={errors.description}
                          value={post.description}
                          {...{type: "input", id: 'description'}}
                          onChange={handleChange}
                          />
            </Col>
          </Row>
        </Col>
      </Row>
      <hr />
      <Row>
        <Col md={2}>
          <legend>Imazhi</legend>
        </Col>
        <Col md={9} xl={8} style={{padding: 0, position: 'relative'}}>
          <ImageDisplay 
            imageUrl={post.image_path || post.image_url} 
            ingredients={ingredients}
            openModal={openModal}
            openEditModal={openEditModal}
          />
        </Col>
      </Row>
    </div>
  )
}

export default PostForm;
