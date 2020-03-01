package com.uber.rib.root;

import com.uber.rib.root.logged_out.LoggedOutBuilder;

import org.junit.Before;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

public class RootRouterTest {

  @Mock RootBuilder.Component component;
  @Mock RootInteractor interactor;
  @Mock RootView view;

  private RootRouter router;

  @Before
  public void setup() {
    MockitoAnnotations.initMocks(this);

    router = new RootRouter(view, interactor, component, new LoggedOutBuilder(component));
  }
}
