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

const PostForm = ({post, onChange, data, setData, newMode = false}) => {
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
                          value={data.title}
                          onChange={e => setData('title', e.target.value)}
                          />
            </Col>
          </Row>
          <Row form>
            <Col>
              <CFormGroup tag={Textarea}
                          label={tp('description')}
                          error={errors.description}
                          placeholder=""
                          value={data.description}
                          {...{type: "input", id: 'description'}}
                          onChange={e => setData('description', e.target.value)}
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
                          onChange={e => setData('avatar', e.target.files[0])}
                          />
            </Col>
          </Row>
        </Col>
      </Row>
    </div>
  )
}

export default PostForm;
