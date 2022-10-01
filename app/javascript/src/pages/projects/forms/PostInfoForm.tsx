import React from 'react';
import {
    Col,
    Input,
    Row
} from 'reactstrap';
import CFormGroup from "../../../shared/CFormGroup";
import useErrors from "../../../shared/useErrors";
import { withScope } from "../../../shared/i18n";

const tp = withScope('activerecord', 'attributes', 'post');
const Textarea = 'textarea';

const PostForm = ({post, onChange, newMode = false}) => {
  function handleChange(e) {
    const {name, value} = e.currentTarget;

    onChange({...post, [name]: value})
  }

  function onImageChange(e) { 
    onChange({...post, image: e.target.files[0]});
  };

  const errors = useErrors('post');
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
                          placeholder=""
                          {...{type: "input", id: 'description'}}
                          onChange={handleChange}
                          />
            </Col>
          </Row>
          <Row form>
            <Col>
              <CFormGroup tag={Input}
                          label={tp('image')}
                          error={errors.image}
                          placeholder=""
                          {...{type: "file", id: 'image'}}
                          onChange={onImageChange}
                          />
            </Col>
          </Row>
        </Col>
      </Row>
    </div>
  )
}

export default PostForm;
