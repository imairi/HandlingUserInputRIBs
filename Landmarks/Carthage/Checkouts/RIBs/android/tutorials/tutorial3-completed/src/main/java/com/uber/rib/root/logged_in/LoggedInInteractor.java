/*
 * Copyright (C) 2017. Uber Technologies
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.uber.rib.root.logged_in;

import android.support.annotation.Nullable;
import com.uber.rib.core.Bundle;
import com.uber.rib.core.EmptyPresenter;
import com.uber.rib.core.Interactor;
import com.uber.rib.core.RibInteractor;
import com.uber.rib.root.logged_in.off_game.OffGameInteractor;

/**
 * Coordinates Business Logic for {@link LoggedInScope}.
 */
@RibInteractor
public class LoggedInInteractor extends Interactor<EmptyPresenter, LoggedInRouter> {

  @Override
  protected void didBecomeActive(@Nullable Bundle savedInstanceState) {
    super.didBecomeActive(savedInstanceState);

    // when first logging in we should be in the OffGame state
    getRouter().attachOffGame();

  }

  class OffGameListener implements OffGameInteractor.Listener {

    @Override
    public void onStartGame() {
      getRouter().detachOffGame();
      getRouter().attachTicTacToe();
    }
  }
}
