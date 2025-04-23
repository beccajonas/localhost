<Screen
  id="settings"
  _customShortcuts={[]}
  _hashParams={[]}
  _searchParams={[]}
  title="Settings"
  urlSlug=""
>
  <Frame
    id="$main5"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    sticky={null}
    type="main"
  >
    <Text
      id="text5"
      value="## {{ retoolContext.pages.find(page => page.isCurrentPage).title }}"
      verticalAlign="center"
    />
    <Form
      id="form3"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="12px"
      requireValidation={true}
      showBody={true}
      showFooter={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="formTitle3"
          value="#### Define api base url"
          verticalAlign="center"
        />
      </Header>
      <Body>
        <TextInput
          id="textInput17"
          label="API base url"
          labelPosition="top"
          placeholder="https://localhost:3000/"
          value="{{ apolloApiBaseUrl.value }}"
        />
      </Body>
      <Footer>
        <Button
          id="formButton3"
          style={{ ordered: [] }}
          submit={true}
          submitTargetId="form3"
          text="Save base URL"
        />
      </Footer>
      <Event
        enabled="{{ !!form3.data.textInput17 }}"
        event="submit"
        method="run"
        params={{
          ordered: [
            {
              src: "if (form3.data.textInput17.endsWith('/')) {\n  apolloApiBaseUrl.setValue(form3.data.textInput17)\n} else {\n  apolloApiBaseUrl.setValue(`${form3.data.textInput17}/`)\n}\n\nawait healtcheck.trigger()",
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Form>
    <Form
      id="form4"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="12px"
      requireValidation={true}
      resetAfterSubmit={true}
      showBody={true}
      showFooter={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="formTitle4"
          value="#### Test connection"
          verticalAlign="center"
        />
      </Header>
      <Body>
        <Status id="status1" itemMode="static" value="pending">
          <Option
            id="471e6"
            color="{{ theme.success }}"
            icon="bold/interface-validation-check-circle"
            label="Connected"
            value="connected"
          />
          <Option
            id="8af01"
            color="{{ theme.warning }}"
            icon="bold/interface-alert-warning-circle"
            label="Pending"
            value="pending"
          />
          <Option
            id="db96d"
            color="{{ theme.danger }}"
            icon="bold/interface-delete-circle"
            label="Something went wrong"
            value="error"
          />
        </Status>
      </Body>
      <Footer>
        <Button id="formButton4" submitTargetId="form4" text="Ping connection">
          <Event
            enabled=""
            event="click"
            method="run"
            params={{
              ordered: [
                {
                  src: 'await healtcheck.trigger()\nif (healtcheck.data.message === 200) {\n  status1.setValue("connected")\n} else {\n  status1.setValue("error")\n}',
                },
              ],
            }}
            pluginId=""
            type="script"
            waitMs="0"
            waitType="debounce"
          />
        </Button>
      </Footer>
    </Form>
  </Frame>
</Screen>
