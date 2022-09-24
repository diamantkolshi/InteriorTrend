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

const PostForm = ({post, onChange, newMode = false}) => {
  const [formConfig, {text, select, date, number}] = useFormState({
    ...post
  }, {
    withIds: true, // enable automatic creation of id and htmlFor props
    onChange: (e, stateValues, nextStateValues) => {
      onChange(nextStateValues);
    }
  });

  const errors = useErrors('project');

  useEffect(() => {
    Object.keys(post).forEach((key) => {
        formConfig.setField(key, post[key]);
    });
  }, [post])

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
                          {...text('title')}
                          />
            </Col>
          </Row>
          <Row form>
            <Col>
              <CFormGroup tag={Textarea}
                          label={tp('description')}
                          error={errors.description}
                          placeholder=""
                          {...text('description')}
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
          <ImageDisplay imageUrl="https://cdn.pixabay.com/photo/2015/09/16/08/55/online-942408_1280.jpg" />
        </Col>
      </Row>
    </div>
  )
}

export default PostForm;
